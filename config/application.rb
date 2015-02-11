require 'rulers'
# prepend the absolute path of app/controllers to LOAD_PATH
$LOAD_PATH << File.expand_path('../app/controllers', File.dirname(__FILE__))
# so we can require quotes_controller.rb in one word
require "quotes_controller"

module BestQuotes
  # create a new application that inherits from our framework (packaged in the gem)
  class Application < Rulers::Application
  end
end