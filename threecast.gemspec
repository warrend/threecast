require_relative './lib/threecast/version'

Gem::Specification.new do |spec|
  spec.name          = "threecast"
  spec.version       = Threecast::VERSION
  spec.authors       = ["Daniel Warren"]
  spec.email         = ["warrend555@gmail.com"]
  spec.files         = ["lib/threecast.rb", "lib/threecast/cli.rb", "lib/threecast/news.rb", "config/environment.rb"]
  #spec.files         = spec.files.grep(%r{^bin/}) { |f| f[3..-1] }
  spec.summary       = %q{Threecast is a CLI gem that scrapes the latest news from the big three cable networks: CNN, MSNBC, and Fox News.}
  spec.homepage      = "https://github.com/warrend/threecast"
  spec.license       = "MIT"
  spec.executables   << "threecast"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", ">=0"
  spec.add_development_dependency "pry", ">=0"
  spec.add_development_dependency "require_all", ">=0"
end
