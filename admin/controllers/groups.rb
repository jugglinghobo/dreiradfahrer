Velo::Admin.controllers :groups do
  get :index do
    @title = "Groups"
    @groups = Group.all
    render 'groups/index'
  end

  get :new do
    @group = Group.new
    render 'groups/new'
  end

  post :create do
    @group = Group.new(params[:group])
    if @group.save
      flash[:success] = 'Land gespeichert'
      redirect url(:groups, :index)
    else
      flash.now[:error] = 'Land wurde nicht gespeichert'
      render 'groups/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "group #{params[:id]}")
    @group = Group.find(params[:id])
    if @group
      render 'groups/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'group', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "group #{params[:id]}")
    @group = Group.find(params[:id])
    if @group
      if @group.update_attributes(params[:group])
        flash[:success] = 'Land gespeichert'
        redirect(url(:groups, :index))
      else
        flash.now[:error] = pat(:update_error, :model => 'group')
        render 'groups/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'group', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Groups"
    group = Group.find(params[:id])
    if group
      if group.destroy
        flash[:success] = 'Land gelöscht'
      else
        flash[:error] = pat(:delete_error, :model => 'group')
      end
      redirect url(:groups, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'group', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Groups"
    unless params[:group_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'group')
      redirect(url(:groups, :index))
    end
    ids = params[:group_ids].split(',').map(&:strip)
    groups = Group.find(ids)
    
    if Group.destroy groups
    
      flash[:success] = pat(:destroy_many_success, :model => 'Groups', :ids => "#{ids.to_sentence}")
    end
    redirect url(:groups, :index)
  end
end
