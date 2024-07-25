# Decorators Changelog
## 2.0.6

* Created branch 'main'
* Updated railties dependency to "railties", ">= 4.0.0", "< 7.2"
* Prevented ArgumentErrors due to load order of decorators where one references a method in another (e.g. application_controller)
