# create a custom controller : Quotes
class QuotesController < Rulers::Controller
  # with a controller action: a_quote
  def a_quote
    render :a_quote, :noun => :winking
  end

  def exception
    raise "It's bad!"
  end

  private

    def output(hash)
      hash.map{|k,v| "#{k}: #{v}"}.sort.join("<br/>")
    end


end