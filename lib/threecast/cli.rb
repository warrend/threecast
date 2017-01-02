class Threecast::CLI
  def call
    list_stories
    menu
    goodbye
  end

  def list_stories
    puts "Today's News Stories:"

    @news = Threecast::News.today
    @news.each.with_index(1) do |story, i|
      puts "#{i}. #{story.network}, #{story.date}: #{story.story}"
    end
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter the story number to open in your browser:"
      input = gets.strip.downcase

      if input.to_i > 0
        open_up = @news[input.to_i - 1]
        system("open", "#{@news.url}")
      else
        puts "Please enter a number or exit."
        list_stories
      end
    end
  end

  def goodbye
    puts "Check back for the latest news."
  end
end