class PostsController < Rulers::Controller

  # Create
  def new
    @post = Post.create "title" => params["title"]
    render_response :show
  end

  # Read
  def show
    @post = find_post
  end

  # Update
  def edit
    @post = find_post
    @post["title"] = "Updated!!!"
    @post.save
    render_response :show
  end

  # Delete
  def destroy
    @post = find_post
    @post.delete!
    render_response :destroyed
  end

  private

    def find_post
      Post.find(params["id"])
    end

end