# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name        = 'flexus'
  gem.version     = '0.1.1'
  gem.authors     = ['The rails, merb & datamapper team', 'Markus Schirp']
  gem.email       = ['mbj@seonic.net']
  gem.description = 'Inflector for strings'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/Ptico/flexus'
  gem.license     = 'MIT'

  gem.require_paths    = %w[lib]
  gem.files            = `git ls-files`.split($/)
  gem.test_files       = `git ls-files spec/{unit,integration}`.split($/)
  gem.extra_rdoc_files = %w[LICENSE.txt README.md TODO]

  gem.required_ruby_version = '>= 2.1'
end
