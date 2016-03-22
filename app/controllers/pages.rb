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

    get :sponsoren_und_goenner, :map => '/sponsoren_und_goenner' do
      render 'sponsoren_und_goenner'
    end

    get :impressum, :map => '/impressum' do
      render 'impressum'
    end

end
