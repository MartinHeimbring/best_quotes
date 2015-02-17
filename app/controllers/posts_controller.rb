class PostsController < Rulers::Controller

  def show
    @post = Post.find(params["id"].to_i)
  end

  def new
    @post = Post.create "title" => "Neuer Post!"
    render_response :show, {:env => env}
  end

  def a_post
    @post = Post.find(1)
  end

end