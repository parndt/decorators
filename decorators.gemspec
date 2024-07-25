Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = "decorators"
  s.version = "2.0.6"
  s.description = "Manages the process of loading decorators into your Rails application."
  s.summary = "Rails decorators plugin."
  s.email = "gems@p.arndt.io"
  s.homepage = "https://github.com/parndt/decorators"
  s.authors = ["Philip Arndt"]
  s.license = "MIT"
  s.require_paths = %w[lib]

  s.files = %w[
    lib/decorators.rb
    lib/decorators/paths.rb
    lib/decorators/railtie.rb
    license.md
    readme.md
  ]

  s.add_dependency "railties", ">= 4.0.0", "< 7.2"
  s.add_development_dependency "rspec", "~> 3.5", ">= 3.5.0"

  s.cert_chain = ["certs/parndt.pem"]
  if $0.end_with?("gem") && ARGV.include?("build") && ARGV.include?(__FILE__)
    s.signing_key = File.expand_path("~/.ssh/gem-private_key.pem")
  end
end
