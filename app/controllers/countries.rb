Velo::Blog.controllers :countries do

  get :index do
    @countries = Country.all
    render 'countries/index'
  end
end
