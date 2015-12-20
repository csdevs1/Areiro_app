class VideosController < ApplicationController
    before_action :require_user, only: [:index, :new, :create, :destroy, :update]
    
    def index
        @videos = Video.all
    end
    
    def show
        @categories = Category.all
        @video = Video.find(params[:id])
    end
    
    def new
        @video = Video.new
    end
    
    def create
        @video = Video.new(product_params)
        if @video.save
            redirect_to '/videos/index'
        else
            render :action => 'new'
        end
    end
    
    def delete
        @video = Video.find(params[:id])
    end
    
    def destroy
        @video = Video.find(params[:id])
        @video.destroy
        redirect_to '/videos/index'
    end
    
    private
        def product_params
            params.require(:video).permit(:url, :title, :description)
        end
end
