Velo::Blog.controllers :posts do
  layout :posts

  get :index do
    @posts = Post.all
    render 'posts/index'
  end
end
