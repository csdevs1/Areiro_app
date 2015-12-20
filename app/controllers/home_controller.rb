class HomeController < ApplicationController
    def index
        @categories = Category.all
        @products = Product.last(8).reverse
        @videos = Video.all
    end
end
