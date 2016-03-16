Velo::Admin.controllers :pages do

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
      if params[:save_and_new]
        redirect url(:posts, :new_page, :id => @page.post_id)
      else
        redirect url(:posts, :pages, :id => @page.post_id)
      end
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
