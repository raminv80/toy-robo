# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toy/robo/version'

Gem::Specification.new do |spec|
  spec.name          = "Robo-on-Ruby"
  spec.version       = Toy::Robo::VERSION
  spec.authors       = ["Ramin Vakilian"]
  spec.email         = ["ramin@vakilian.net"]

  spec.summary       = %q{A test program as proof of my ruby skills.}
  spec.description   = %q{I am a ruby on rails developer with more than 8 years of experience in IT. Recently I applied for job and received this test to showcase my abilities in Ruby. To be honest this test was out there for some time and I heard from friends they received the same test. There are lots of implemented solutions out there for this question. It's hard to come out with a great solution which would not be similar to one of this answers, however I decided to implement it from ground up using a gemified method and command  to keep the originality.}
  #spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.7.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
end
