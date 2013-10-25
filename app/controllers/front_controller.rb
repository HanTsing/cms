class FrontController < ApplicationController
  def index
    @posts =  Post.published.page(params[:page])
  end
end
