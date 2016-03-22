Velo::Blog.controllers :pages do

    get :map, :map => '/map' do
      render 'map'
    end

    get :projekt, :map => 'projekt' do
      render 'projekt'
    end

    get :wir, :map => '/wir' do
      render 'wir'
    end

    get :sponsoren, :map => '/sponsoren' do
      render 'sponsoren'
    end

end
