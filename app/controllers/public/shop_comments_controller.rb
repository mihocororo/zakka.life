class Public::ShopCommentsController < ApplicationController
  def index
  end

  def update
  end

  def show
  end

  def new
    @shop_comment = ShopComment.new
  end

  def edit
  end
  private
  def shop_comment_params
    params.require(:shop_comment).permit(:title, :learn, :about, :category, :overrall)
  end
end