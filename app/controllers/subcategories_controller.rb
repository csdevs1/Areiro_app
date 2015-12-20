class SubcategoriesController < ApplicationController
    def show
        @categories = Category.all
        @subcategory = Subcategory.find(params[:id])
        @products = @subcategory.products 
    end
end
