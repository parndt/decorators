# Decorators Plugin [![Build Status](https://secure.travis-ci.org/parndt/decorators.png?branch=master)](http://travis-ci.org/parndt/decorators)

This is a very simple plugin that adds support for decorators to your Rails application.
Effectively all that this does is allow you to register paths in which to search
for decorators which are then loaded at the appropriate point in your application's
initialisation process.

Decorators must follow this naming convention:

    app/decorators/<at least one subdirectory>/something_decorator.rb

This is an example of a decorator that will be loaded:

    app/decorators/controllers/pages_controller_decorator.rb

These are examples of decorators that *won't* be loaded:

    app/decorators/pages_controller_decorator.rb
    app/decorators/controllers/pages_controller.rb

The important parts are being inside a sub directory of `app/decorators` and having
`_decorator.rb` at the end of the file's name.

## How to install

In your Gemfile, add the gem:

```ruby
gem 'decorators', '~> 1.0.0'
```

Now, run `bundle install` and the gem should install.

## How to use

There really is just one method to call; `Decorators#register!`.
Simply pass one path or many paths to the method to register paths to search
inside for decorators to be loaded from.

```ruby
require 'decorators'
Decorators.register! Rails.root
```

Or for many paths:

```ruby
require 'decorators'
Decorators.register! Rails.root, Rails.root.join('vendor', 'extensions', 'extension_with_decorators')
```
## License

Decorators is released under the [MIT license](https://github.com/parndt/decorators/blob/master/license.md#readme)
and is copyright (c) 2013 [Philip Arndt](http://philiparndt.name)
