require 'rails_helper'

describe ProductsController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do
    it "populates an array of products ordered by created_at DESC" do
      products = create_list(:product, 3) 
      get :index
      expect(assigns(:products)).to match(products.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #search' do
    it "renders the :search template" do
      get :search
      expect(response).to render_template :search
    end
  end

end