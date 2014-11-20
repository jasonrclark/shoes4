# -*- encoding: utf-8 -*-
require_relative 'lib/shoes/version'
require_relative 'manifests/shoes-core'

Gem::Specification.new do |s|
  s.name        = "shoes-core"
  s.version     = Shoes::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Team Shoes"]
  s.email       = ["shoes@librelist.com"]
  s.homepage    = "https://github.com/shoes/shoes4"
  s.summary     = %q{The best little DSL for the best little GUI toolkit for Ruby.}
  s.description = %q{Shoes is the best little GUI toolkit for Ruby. Shoes makes building for Mac, Windows, and Linux super simple. This is the DSL for writing your app. You'll need a backend to run it.}
  s.license     = 'MIT'

  s.files         = ShoesCoreManifest.files
  s.test_files    = ShoesCoreManifest.test_files
  s.require_paths = ["lib"]
end