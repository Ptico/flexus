
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "flexus/version"

Gem::Specification.new do |spec|
  spec.name        = "flexus"
  spec.version     = Flexus::VERSION
  spec.authors     =
    [ "The rails, merb & datamapper team",
      "Markus Schirp",
      "Andrii Savchenko",
      "Abinoam P. Marques Jr." ]
  spec.email       = ["abinoam@gmail.com"]
  spec.description = "Inflector for strings"
  spec.summary     = spec.description
  spec.homepage    = "https://github.com/Ptico/flexus"
  spec.license     = "MIT"

  spec.require_paths    = %w[lib]

  spec.files       = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|config)/})
  end

  spec.extra_rdoc_files = %w[LICENSE.txt README.md TODO]

  spec.required_ruby_version = ">= 2.1"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
