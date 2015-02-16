# create a custom controller : Quotes
class QuotesController < Rulers::Controller
  # with a controller action: a_quote
  def a_quote
    "There is nothing either good or bad but thinking makes it so." #+
    # the ENV is inherited from Rulers::Controller
    #"<br/><br/> #{output(env)}"
  end

  def exception
    raise "It's bad!"
  end

  private

    def output(hash)
      hash.map{|k,v| "#{k}: #{v}"}.sort.join("<br/>")
    end


end