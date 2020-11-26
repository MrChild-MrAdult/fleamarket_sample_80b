class CategoriesController < ApplicationController
  before_action :category, only: [:parent, :child, :grandchild]
  before_action :set_categories, only: [:parent, :child]

  def index
    @parents = Category.where(ancestry: nil)
  end

  def parent
  end

  def child
  end

  def grandchild
  end

  private

  def category
    @category = Category.find(params[:id])
  end

  def set_categories
    @categories = @category.descendants
    @categories_product = Product.where(category_id: @categories.first.id..@categories.last.id)
  end

end

