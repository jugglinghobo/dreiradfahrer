Velo::Blog.controllers :posts do

  get :index do
    @posts = Post.all
    render 'posts/index'
  end
end
