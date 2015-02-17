# create a custom controller : Quotes
class QuotesController < Rulers::Controller
  # with a controller action: a_quote
  def a_quote
    # no need to call render anymore because I implemented Rails Automatic rendering
    # where I automatically render a template with the name of the controller action
    # render :a_quote, :noun => :winking
  end

  def show
    quote = FileModel.find(params["id"])
    render_response :quote, {
                    # quote, params, fullpath and path are available as instance methods on Rulers::Controller
                    # they are a shortcut for saying e.g. request.quote
                    :obj => quote,
                    :params => params,
                    :fullpath => fullpath,
                    :path => path,
                    # to access a Rack::Request instance method we would have to call it directly on the request object provided by the Rulers::Controller
                    :host => request.host}
  end

  def new_quote
    attrs = {
        "submitter" => "web user",
        "quote" => "A picture is woth one k pixels",
        "attribution" => "Me"
    }
    m = FileModel.create attrs
    render :quote, :obj => m
  end

  def index
    quotes = FileModel.all
    render_response :index, :quotes => quotes
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def exception
    raise "It's bad!"
  end

  private

    def output(hash)
      hash.map{|k,v| "#{k}: #{v}"}.sort.join("<br/>")
    end


end