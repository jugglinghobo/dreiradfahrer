Velo::Blog.controllers :posts do
  layout :posts

  get :index do
    @title = "Posts"
    @posts = Post.all
    render 'posts/index'
  end
end
