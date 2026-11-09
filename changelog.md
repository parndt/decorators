# Decorators Changelog
## 2.1.0

* Supported Rails 7.2, 8.0 and 8.1 (railties below 9)
* Supported Zeitwerk: registered decorator directories are ignored by the autoloader, while files directly inside `app/decorators` stay autoloadable
* Supported Ruby 2.7 to 4.0
* Released with RubyGems trusted publishing; gems are no longer signed

## 2.0.6

* Created branch 'main'
* Updated railties dependency to "railties", ">= 4.0.0", "< 7.2"
* Prevented ArgumentErrors due to load order of decorators where one references a method in another (e.g. application_controller)
