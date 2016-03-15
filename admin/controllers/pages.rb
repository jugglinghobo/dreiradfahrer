Velo::Admin.controllers :pages do
  put :create do
    @post = Post.find params[:post_id]
    @page = @post.build_page params[:page]
    if @page.save
      @title = pat(:create_title, :model => "page #{@page.id}")
      flash[:success] = pat(:create_success, :model => 'Page')
      redirect(url(:pages, :edit, :id => @page.id))
    else
      @title = pat(:create_title, :model => 'page')
      flash.now[:error] = pat(:create_error, :model => 'page')
      render 'pages/new'
    end
  end

  put :update_layout, :with => :id do
    @page = Page.find params[:id]
    @page.update_attributes params[:page]
    partial "pages/#{@page.layout}", :locals => { :page => @page }
  end

  get :edit, :with => :id do
    @page = Page.find params[:id]
    render 'pages/edit'
  end

  put :update, :with => :id do
    @page = Page.find params[:id]
    if @page.update_attributes params[:page]
      flash[:success] = 'Seite angepasst'
        redirect url(:posts, :edit, :id => @page.post_id)
    else
      flash.now[:error] = 'Seite wurde nicht angepasst'
      render 'pages/edit'
    end
  end

  delete :destroy, :with => :id do
    page = Page.find params[:id]
    if page.destroy
      flash[:success] = 'Seite gelöscht'
    else
      flash[:error] = 'Seite wurde nicht gelöscht'
    end
    redirect url(:posts, :edit, :id => page.post_id)
  end
end
