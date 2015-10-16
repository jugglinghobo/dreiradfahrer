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
    @title = pat(:edit_title, :model => "page #{params[:id]}")
    @page = Page.find(params[:id])
    if @page
      render 'pages/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'page', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "page #{params[:id]}")
    @page = Page.find(params[:id])
    if @page
      if @page.update_attributes(params[:page])
        flash[:success] = pat(:update_success, :model => 'Page', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:pages, :edit, :id => @page.id)) :
          redirect(url(:posts, :edit, :id => @page.post_id))
      else
        flash.now[:error] = pat(:update_error, :model => 'page')
        render 'pages/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'page', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Pages"
    page = Page.find(params[:id])
    if page
      if page.destroy
        flash[:success] = pat(:delete_success, :model => 'Page', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'page')
      end
      redirect url(:posts, :edit, :id => page.post_id)
    else
      flash[:warning] = pat(:delete_warning, :model => 'page', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Pages"
    unless params[:page_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'page')
      redirect(url(:pages, :index))
    end
    ids = params[:page_ids].split(',').map(&:strip)
    pages = Page.find(ids)

    if Page.destroy pages

      flash[:success] = pat(:destroy_many_success, :model => 'Pages', :ids => "#{ids.to_sentence}")
    end
    redirect url(:pages, :index)
  end
end
