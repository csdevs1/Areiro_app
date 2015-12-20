class ProductsController < ApplicationController
    before_action :require_user, only: [:index, :new, :create, :destroy, :update]
    
    def index
        @products = Product.all
    end
    
    def show
        @categories = Category.all
        @product = Product.find(params[:id])
        @images = @product.images 
    end
    
    def new
        @categories = Category.all
        @subcategories = Subcategory.all
        @product = Product.new
        4.times { @product.images.build }
    end
    
    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to admin_path
        else
            render :action => 'new'
        end
    end
    
    def edit
        @product = Product.find(params[:id])
        @images = @product.images
    end
    
    def update
        @product = Product.find(params[:id])
        if @product.update(update_params)
            redirect_to admin_path
        else
            render 'edit'
        end
    end
    
    def delete
        @product = Product.find(params[:id])
    end
    
    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to admin_path
    end
    
    private
        def product_params
            params.require(:product).permit(:title, :info_item, :description, :price, :subcategory_id, :category_id, :images_attributes => [:image])
        end
    
    private
        def update_params
            params.require(:product).permit(:title, :info_item, :description, :price, :images_attributes => [:image] )
        end
end
