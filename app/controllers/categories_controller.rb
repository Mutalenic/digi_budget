class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  def index
    @user = current_user
    @categories = current_user.categories.includes(:payments).order(created_at: :desc)
  end

    def create
      add_category = current_user.categories.new(category_params)


      if add_category.save
        redirect_to categories_path, notice: 'Category was successfully created.'
      else
        render :new, notice: 'Category was not created.'
      end
    end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit, notice: 'Category was not updated.'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.permit(:name, :icon)
  end
    
end
