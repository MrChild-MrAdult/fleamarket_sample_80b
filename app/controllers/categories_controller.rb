class CategoriesController < ApplicationController

  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @products = @products.where(buyer_id: nil).order("created_at DESC").page(params[:page]).per(9)
  end

end

