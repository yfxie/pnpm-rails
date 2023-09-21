# frozen_string_literal: true

require_relative "lib/pnpm/version"

Gem::Specification.new do |spec|
  spec.name = "pnpm-rails"
  spec.version = Pnpm::VERSION
  spec.authors = ["Yi Feng Xie"]
  spec.email = ["yfxie@me.com"]
  spec.homepage = "https://github.com/yfxie/pnpm-rails"
  spec.summary = "For Rails projects using pnpm as package manager."
  spec.license = "MIT"
  spec.files = Dir["lib/**/*", "MIT-LICENSE", "README.md"]

  spec.add_dependency "railties", ">= 6.0.0"
end
