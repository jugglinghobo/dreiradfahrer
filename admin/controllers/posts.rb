Velo::Admin.controllers :posts do

  put :update_layout, :with => :id do
    @post = Post.find params[:id]
    @post.update_attributes params[:post]
    partial "posts/#{@post.layout}", :locals => { :post => @post }
  end

  get :edit, :with => :id do
    @post = Post.find params[:id]
    render 'posts/edit'
  end

  put :update, :with => :id do
    @post = Post.find params[:id]
    if @post.update_attributes params[:post]
      flash[:success] = 'Seite angepasst'
      if params[:save_and_new]
        redirect url(:countries, :new_post, :id => @post.country_id)
      else
        redirect url(:countries, :posts, :id => @post.country_id)
      end
    else
      flash.now[:error] = 'Seite wurde nicht angepasst'
      render 'posts/edit'
    end
  end

  delete :destroy, :with => :id do
    post = Post.find params[:id]
    if post.destroy
      flash[:success] = 'Seite gelöscht'
    else
      flash[:error] = 'Seite wurde nicht gelöscht'
    end
    redirect url(:countries, :edit, :id => post.country_id)
  end
end
