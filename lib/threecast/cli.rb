class Threecast::CLI
  def call
    list_stories
    menu
    goodbye
  end

  def list_stories
    puts ""
    puts "Welcome to Threecast"
    puts "Here are today's top news stories:"
    puts "------------------------------------"
    puts ""

    @news = Threecast::News.today
    @news.each.with_index(1) do |story, i|
      puts "(#{i}) #{story.network} - #{story.date}: #{story.story}"
      puts "" unless i == 3
    end
  end

  def menu
    input = nil
    while input != 'exit'
      puts "------------------------------------"
      puts "Enter the story number to open in your browser or exit:"
      input = gets.strip.downcase

      if input.to_i.between?(1,3)
        open_up = @news[input.to_i - 1]
        system("open", "#{open_up.url}")
        list_stories
        menu
      else
        puts "Please enter a number or exit."
      end
    end
    goodbye
  end

  def goodbye
    puts "Check back for the latest news."
    exit
  end
end