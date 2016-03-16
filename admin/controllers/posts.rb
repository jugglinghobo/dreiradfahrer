Velo::Admin.controllers :posts do
  get :index do
    @posts = if params[:group_id]
               Post.where :group_id => params[:group_id]
             else
               Post.all
             end
    render 'posts/index'
  end

  get :new do
    @post = Post.new
    render 'posts/new'
  end

  post :create do
    @post = Post.new params[:post]
    if @post.save
      flash[:success] = 'Post gespeichert'
      redirect url(:posts, :pages, :id => @post.id)
    else
      flash.now[:error] = 'Post wurde nicht gespeichert'
      render 'posts/new'
    end
  end

  get :edit, :with => :id do
    @post = Post.find(params[:id])
    render 'posts/edit'
  end

  put :update, :with => :id do
    @post = Post.find(params[:id])
    if @post.update_attributes params[:post]
      flash[:success] = 'Post angepasst'
      redirect url(:posts, :index, :group_id => @post.group_id)
    else
      flash.now[:error] = 'Post wurde nicht angepasst'
      render 'posts/edit'
    end
  end

  delete :destroy, :with => :id do
    post = Post.find(params[:id])
    if post.destroy
      flash[:success] = 'Post gelöscht'
    else
      flash[:error] = 'Post wurde nicht gelöscht'
    end
    redirect url(:posts, :index)
  end

  get :pages, :with => :id do
    @post = Post.find params[:id]
    @pages = @post.pages
    render 'pages/index'
  end

  get :new_page, :with => :id do
    @post = Post.find params[:id]
    @page = @post.create_page
    redirect_to url(:pages, :edit, :id => @page.id)
  end

end
