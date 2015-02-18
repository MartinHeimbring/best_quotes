require './config/application'

# try to guess content-type and set it
use Rack::ContentType

# This is a simple benchmark middleware that runs the next app (in this case, Rack::Lobster)
# many times and then figures out how many milliseconds it took on average.

class BenchMarker
  def initialize(app, runs = 100)
    @app, @runs = app, runs
  end

  def call(env)
    t = Time.now

    result = nil
    @runs.times { result = @app.call(env) }

    t2 = Time.now - t
    STDERR.puts <<OUTPUT
Benchmark:
  #{@runs} runs
  #{t2.to_f} seconds total
  #{t2.to_f * 1000.0 / @runs} millisec/run
OUTPUT

    result
  end
end

# use my custom Rack middleware whenever I want to test performance of a layer of my app
# use BenchMarker, 10_000


=begin
  # use a build in Rack middleware:
  # Rack::URLMap - Route different directories to different apps or different stacks.
  # I can also use this with a “map” block in config.ru. like so:

  map "/" do
    run QuotesController.action(:index)
  end
=end

  # use own DSL to match routes

app = BestQuotes::Application.new

app.route do
  # root path:
  match "", "quotes#index"
  # we can run a proc directly
  match "sub-app", proc{ [200, {}, ["Hello, sub-app!"]]}

  # default routes
  match ":controller/:id/:action"
  match ":controller/:id", :default => { "action" => "show" }
  match ":controller", :default => { "action" => "index" }
end

run app


