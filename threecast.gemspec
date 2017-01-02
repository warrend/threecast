# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'threecast/version'

Gem::Specification.new do |spec|
  spec.name          = "threecast"
  spec.version       = Threecast::VERSION
  spec.authors       = ["Daniel Warren"]
  spec.email         = ["warrend555@gmail.com"]

  spec.summary       = %q{Threecast is a CLI gem that scrapes the latest news from the big three cable networks: CNN, MSNBC, and Fox News.}
  spec.homepage      = "https://github.com/warrend/threecast"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", ">=0"
  spec.add_development_dependency "pry", ">=0"
  spec.add_development_dependency "require_all", ">=0"
end
