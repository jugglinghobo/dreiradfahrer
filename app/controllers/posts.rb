Velo::Blog.controllers :posts do
  get :index do
    @title = "Posts"
    @posts = Post.all
    render 'posts/index'
  end
end
