class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new # Needed to instantiate the form_with
  end

  def create
    @category = Category.new(category_params)
    @category.save # Will raise ActiveModel::ForbiddenAttributesError
    if @category.save
      redirect_to category_path(@category)
    else
        render :new, status: :unproccessable_entry
    end
  end

  def destory
    @category = @Category.find(params[:id])
    @category.destroy
    redirect_to category_path, status: :see_other
  end

  def article_params
    params.require(:article).permit(:title, :body, photos: [])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def article_params
    params.require(:article).permit(:title, :body, :photo)
  end
  
end
