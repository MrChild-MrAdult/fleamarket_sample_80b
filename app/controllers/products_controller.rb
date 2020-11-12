class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def show 
    @grandchild = @product.category
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def check
  end

  def search
  end

  def get_category_children
    respond_to do |format| 
      format.html
      format.json do
        @category_children = Category.find("#{params[:parent_id]}").children
      end
    end
  end
  
  def get_category_grandchildren
    respond_to do |format| 
      format.html
      format.json do
        @category_grandchildren = Category.find("#{params[:child_id]}").children
      end
    end
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
