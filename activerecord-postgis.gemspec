require './lib/active_record/postgis/version.rb'

Gem::Specification.new do |spec|
  spec.name = 'activerecord-postgis'
  spec.summary = 'ActiveRecord extension for PostGIS, based on RGeo.'
  spec.description = "ActiveRecord connection extension for PostGIS. It extends the stock PostgreSQL adapter, providing built-in support for the spatial extensions provided by PostGIS. It uses the RGeo library to represent spatial data in Ruby."
  spec.version = ActiveRecord::PostGIS::VERSION
  spec.authors = ['Daniel Azuma', 'Tee Parham']
  spec.email = ['dazuma@gmail.com', 'parhameter@gmail.com']
  spec.homepage = "http://github.com/seuros/activerecord-postgis-adapter"
  spec.licenses = ['BSD']

  spec.files = Dir['lib/**/*', 'test/**/*', 'LICENSE.txt']
  spec.test_files = Dir['test/**/*']
  spec.platform = Gem::Platform::RUBY

  spec.required_ruby_version = '>= 2.2.0'

  spec.add_dependency 'pg', '~> 0.18'
  spec.add_dependency 'activerecord', '~> 4.2.0'
  spec.add_dependency 'rgeo-activerecord', '~> 1.0'

  spec.add_development_dependency 'rake', '~> 10.2'
end
