require 'rails'
require 'clockpicker-rails/version'

module Clockpicker
  module Rails
    if ::Rails.version < '3.1'
      require 'clockpicker-rails/railtie'
    else
      require 'clockpicker-rails/engine'
    end
  end
end
