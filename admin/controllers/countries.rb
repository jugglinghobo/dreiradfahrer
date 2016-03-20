Velo::Admin.controllers :countries do
  get :index do
    @countries = Country.all
    render 'countries/index'
  end

  get :new do
    @country = Country.new
    render 'countries/new'
  end

  post :create do
    @country = Country.new params[:country]
    if @country.save
      flash[:success] = 'Land gespeichert'
      redirect url(:countries, :index)
    else
      flash.now[:error] = 'Land wurde nicht gespeichert'
      render 'countries/new'
    end
  end

  get :edit, :with => :id do
    @country = Country.find params[:id]
    render 'countries/edit'
  end

  put :update, :with => :id do
    @country = Country.find params[:id]
    if @country.update_attributes params[:country]
      flash[:success] = 'Land gespeichert'
      redirect url(:countries, :index)
    else
      flash.now[:error] = 'Land wurde nicht gespeichert'
      render 'countries/edit'
    end
  end

  delete :destroy, :with => :id do
    country = Country.find params[:id]
    if country.destroy
      flash[:success] = 'Land gelöscht'
    else
      flash[:error] = 'Land wurde nicht gelöscht'
    end
    redirect url(:countries, :index)
  end

  get :posts, :with => :id do
    @country = Country.find params[:id]
    @posts = @country.posts.ordered
    render 'posts/index'
  end

  get :new_post, :with => :id do
    @country = Country.find params[:id]
    @post = @country.create_post
    redirect_to url(:posts, :edit, :id => @post.id)
  end
end
