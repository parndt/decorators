Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{decorators}
  s.version           = %q{1.0.1}
  s.description       = %q{Manages the process of loading decorators into your Rails application.}
  s.summary           = %q{Rails decorators plugin.}
  s.email             = %q{parndt@gmail.com}
  s.homepage          = %q{http://philiparndt.name}
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

  s.add_dependency    'railties', '>= 3.2.11'
end
