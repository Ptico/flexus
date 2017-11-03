flexus
========

[![Gem Version](https://badge.fury.io/rb/flexus.png)][gem]
[![Build Status](https://secure.travis-ci.org/Ptico/flexus.png?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/badges/github.com/Ptico/flexus.svg)][gemnasium]
[![Code Climate](https://codeclimate.com/github/Ptico/flexus.png)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/Ptico/flexus/badge.png?branch=master)][coveralls]

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

Version `0.1.1` have some performance improvements and bugfixes, but trying to not break the `inflecto` functionality. So just change `inflecto` to `flexus` and lock the version to `0.1.1`.

```ruby
gem 'flexus', '0.1.1'
```

Other versions till `1.0.0` can break things. So use `~> 0.1` on your own risk.

Examples
--------

Soon.

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

See LICENSE for details
