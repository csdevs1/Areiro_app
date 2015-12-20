class SearchController < ApplicationController
  def show
      @categories = Category.all
      if params[:q] != ""
          @product_val = Product.where('title ILIKE ?', "%#{params[:q]}%")
          if @product_val.blank?
              flash[:empty] = "Search not successful"
          else
              @products = @product_val
          end
     else
        flash[:error] = "Search not successful"
      end
  end
end