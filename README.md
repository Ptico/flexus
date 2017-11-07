flexus
========

[![Gem Version](https://img.shields.io/gem/v/flexus.svg)][gem]
[![Build Status](https://img.shields.io/travis/Ptico/flexus.svg)][travis]
[![Dependency Status](https://gemnasium.com/badges/github.com/Ptico/flexus.svg)][gemnasium]
[![Maintainability](https://api.codeclimate.com/v1/badges/13a7eecf99ae954a5786/maintainability)](https://codeclimate.com/github/Ptico/flexus/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/13a7eecf99ae954a5786/test_coverage)](https://codeclimate.com/github/Ptico/flexus/test_coverage)
[![Coverage Status](https://coveralls.io/repos/github/Ptico/flexus/badge.svg?branch=master)][coveralls]

[gem]: https://rubygems.org/gems/flexus
[travis]: https://travis-ci.org/Ptico/flexus
[gemnasium]: https://gemnasium.com/Ptico/flexus
[codeclimate]: https://codeclimate.com/github/Ptico/flexus
[coveralls]: https://coveralls.io/r/Ptico/flexus

This gem is a resurrection of [inflecto](https://github.com/mbj/inflecto)

Inflecto is a standalone inflector ripped out from [dm-core](https://github.com/datamapper/dm-core)

The dm-core inflector originated from [extlib](https://github.com/datamapper/extlib)

The extlib inflecto originated from [active_support](https://github.com/rails/rails)

Migration from `inflecto`
-------------------------

Remove inflecto and add flexus to your Gemfile.

```ruby
gem 'flexus', '1.0.0'
```

At your code, change all `Inflecto` references to `Flexus` and it should work out of the box for flexus version 1.0.0. Please report any issues.

Flexus will try the best to respect semantic versioning as http://semver.org/
So, expect api breaking changes on major version releases.

We'll make pre release gems for 2.0.0 version. To experiment with that you should add this to your Gemfile.

```ruby
gem 'flexus', '>= 2.0.0.beta'
```

Examples
--------

```ruby
require 'flexus'

Flexus.underscore("CamelCase")
# => "camel_case"

inflector = Flexus.new

# This loads reasonably good defaults to english language
# singularization and pluralization.
inflector.load_defaults

inflector.pluralize("tomato")
# => "tomatoes"

# You can override rules on a per instance base
inflector.inflections do |inflect|
  inflect.plural(/(tomat)o\z/i, '\1ozechies')
end

inflector.pluralize("tomato")
# => "tomatozechies"

Flexus.pluralize("tomato")
# => "tomatoes" # <- Still default pluralization

```

Credits
-------

The rails, merb & datamapper team

The original gem was extracted and maintained by Markus Schirp ([mbj](https://github.com/mbj)) with help from [indrekj](https://github.com/indrekj).

Current maintainers: Andrii Savchenko [Ptico](https://github.com/Ptico) and Abinoam P. Marques Jr. [abinoam](https://github.com/abinoam)

Contributing
-------------

* If you want your code merged into the mainline, please discuss the proposed changes with me before doing any work on it. This library is still in early development, and the direction it is going may not always be clear. Some features may not be appropriate yet, may need to be deferred until later when the foundation for them is laid, or may be more applicable in a plugin.
* Fork the project.
* Make your feature addition or bug fix.
  * Follow this [style guide](https://github.com/dkubb/styleguide).
* Add specs for it. This is important so I don't break it in a future version unintentionally. Tests must cover all branches within the code, and code must be fully covered.
* Commit, do not mess with Rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Run "rake ci". This must pass and not show any regressions in the metrics for the code to be merged.
* Send me a pull request. Bonus points for topic branches.

License
-------

See LICENSE.txt for details
