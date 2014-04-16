# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/instrument/version'

Gem::Specification.new do |gem|
  gem.name          = 'activerecord-instrument'
  gem.version       = ActiveRecord::Instrument::VERSION
  gem.authors       = [ 'Chris Bielinski' ]
  gem.email         = [ 'chris.bielinski@robotsandrockets.co' ]
  gem.description   = %q{Adds NewRelic instrumentation around ActiveRecord internals.}
  gem.summary       = %q{Adds NewRelic instrumentation around ActiveRecord internals.}
  gem.homepage      = 'http://github.com/chrisb/activerecord-instrumentation'

  gem.add_dependency 'newrelic_rpm'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
