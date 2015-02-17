require 'rulers'
# prepend the absolute path of app/models to LOAD_PATH
$LOAD_PATH << File.expand_path('../app/models', File.dirname(__FILE__))
# prepend the absolute path of app/controllers to LOAD_PATH
$LOAD_PATH << File.expand_path('../app/controllers', File.dirname(__FILE__))
# so we could require quotes_controller.rb in one word
# require "quotes_controller"
# thanks to ruby magic happening in the router we do not need to require any controller files manually anymore...
# Object.const_missing handles the autoloading of controller files!

# get path to all model files and store them in an array
model_files = Dir[File.expand_path('../app/models/*.rb', File.dirname(__FILE__))]
# we still need to require the models manually though, no autoloading happening here ;-)
model_files.each { |f| require f }


module BestQuotes
  # create a new application that inherits from our framework (packaged in the gem)
  class Application < Rulers::Application
  end
end