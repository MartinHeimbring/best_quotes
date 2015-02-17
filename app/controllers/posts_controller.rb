class PostsController < Rulers::Controller

  def show
    @post = Post.find(params["id"])
  end

  def new
    @post = Post.create "title" => "Neuer Post!"
    render_response :show, {:env => env}
  end


end