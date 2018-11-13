# Clockpicker::Rails [![Build Status](https://secure.travis-ci.org/TwilightCoders/clockpicker-rails.png)](http://travis-ci.org/TwilightCoders/clockpicker-rails) [![Gem Version](https://badge.fury.io/rb/clockpicker-rails.png)](http://badge.fury.io/rb/clockpicker-rails) [![Code Climate](https://codeclimate.com/github/TwilightCoders/clockpicker-rails.png)](https://codeclimate.com/github/TwilightCoders/clockpicker-rails) [![Dependancies](http://img.shields.io/gemnasium/TwilightCoders/clockpicker-rails.svg)](https://gemnasium.com/TwilightCoders/clockpicker-rails)

Wire up the [Clockpicker](http://weareoutman.github.io/clockpicker/) [assets](https://github.com/weareoutman/clockpicker) for your Rails
applications.

## Getting Started

If you're using Bundler, you can add clockpicker-rails to your Gemfile:

```ruby
gem 'clockpicker-rails'
```

Or manually install the clockpicker-rails gem:

```shell
gem install clockpicker-rails
```

## Clockpicker::Rails for Rails >= 3.1

All of the assets from the most latest stable Clockpicker::Rails release are vendored
so that you can use them with the asset pipeline.  You will want the following in
your application.js and application.css:

```js
//= require jquery/clockpicker
// or...
//= require jquery/clockpicker.min
// or...
//= require bootstrap/clockpicker
// or...
//= require bootstrap/clockpicker.min
```

```css
*= require jquery/clockpicker
// or...
*= require jquery/clockpicker.min
// or...
*= require bootstrap/clockpicker
// or...
*= require bootstrap/clockpicker.min
```

### Contributing

Find a mistake? New version of Clockpicker::Rails? Submit a pull request!

---

Copyright (c) 2015 Dale Stevens, released under the MIT license
