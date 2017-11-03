
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flexus/version'

Gem::Specification.new do |gem|
  gem.name        = 'flexus'
  gem.version     = Flexus::VERSION
  gem.authors     = ['The rails, merb & datamapper team', 'Markus Schirp',
                     'Andrii Savchenko', 'Abinoam P. Marques Jr.']
  gem.email       = ['abinoam@gmail.com']
  gem.description = 'Inflector for strings'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/Ptico/flexus'
  gem.license     = 'MIT'

  gem.require_paths    = %w[lib]

  gem.files       = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|gem|features|config)/})
  end

  gem.extra_rdoc_files = %w[LICENSE.txt README.md TODO]

  gem.required_ruby_version = '>= 2.1'

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
