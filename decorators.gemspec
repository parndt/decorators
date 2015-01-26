Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{decorators}
  s.version           = %q{1.0.4}
  s.description       = %q{Manages the process of loading decorators into your Rails application.}
  s.summary           = %q{Rails decorators plugin.}
  s.email             = %q{p@arndt.io}
  s.homepage          = %q{https://github.com/parndt/decorators}
  s.authors           = ['Philip Arndt']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)

  s.files             = %w[
    lib/decorators.rb
    lib/decorators/paths.rb
    lib/decorators/railtie.rb
    license.md
    readme.md
  ]

  s.add_dependency             'railties', '>= 3.0.19'
  s.add_development_dependency 'rspec'
end
