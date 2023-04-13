class Admin::PostShopsController < ApplicationController
  before_action  :authenticate_admin!
  def show
    @post_shop = PostShop.find(params[:id])
  end

  def update
  end

  def destroy
    @post_shop = PostShop.find(params[:id])
    @post_shop.destroy
    redirect_to '/admin/post_shops'
  end


  def index
    # @post_shops = PostShop.all
    @post_shops = PostShop.page(params[:page])

  end
end
