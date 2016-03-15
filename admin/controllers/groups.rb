Velo::Admin.controllers :groups do
  get :index do
    @groups = Group.all
    render 'groups/index'
  end

  get :new do
    @group = Group.new
    render 'groups/new'
  end

  post :create do
    @group = Group.new params[:group]
    if @group.save
      flash[:success] = 'Land gespeichert'
      redirect url(:groups, :index)
    else
      flash.now[:error] = 'Land wurde nicht gespeichert'
      render 'groups/new'
    end
  end

  get :edit, :with => :id do
    @group = Group.find params[:id]
    render 'groups/edit'
  end

  put :update, :with => :id do
    @group = Group.find params[:id]
    if @group.update_attributes params[:group]
      flash[:success] = 'Land gespeichert'
      redirect url(:groups, :index)
    else
      flash.now[:error] = 'Land wurde nicht gespeichert'
      render 'groups/edit'
    end
  end

  delete :destroy, :with => :id do
    group = Group.find params[:id]
    if group.destroy
      flash[:success] = 'Land gelöscht'
    else
      flash[:error] = 'Land wurde nicht gelöscht'
    end
    redirect url(:groups, :index)
  end
end
