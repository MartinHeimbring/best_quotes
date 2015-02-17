# create a custom controller : Quotes
class QuotesController < Rulers::Controller
  # with a controller action: a_quote
  def a_quote
    render :a_quote, :noun => :winking
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
    render :index, :quotes => quotes
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