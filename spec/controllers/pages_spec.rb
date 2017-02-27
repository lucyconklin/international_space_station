require 'rails_helper'

describe PagesController do
  it 'root path is pages#index' do
    get :index
    expect(response).to render_template(:index)
  end

  xit 'about path is pages#about' do
    get '/about'
    expect(response).to render_template(:about)
  end

  xit 'who is in space? path is pages#who' do
    get '/who_is_in_space'
    expect(response).to render_template(:who_is_in_space)
  end
end
