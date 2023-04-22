class Public::PostShopsController < ApplicationController
before_action :ensure_current_customer, {only: [:edit,:update]}


  def index
    @post_shops = PostShop.page(params[:page])



  end



  def show
    @post_shop = PostShop.find(params[:id])
    @shop_comment = ShopComment.new


  end

  def edit
    @post_shop = PostShop.find(params[:id])

  end



  def create
    @post_shop = PostShop.new(post_shop_params)
    @post_shop.customer_id = current_customer.id
    if @post_shop.save
      redirect_to shops_path
    else
      render :new
    end


    @shop_comment = ShopComment.new



  end

  def update
    @post_shop = PostShop.find(params[:id])
    if @post_shop.update(post_shop_params)
    redirect_to shops_path
    else
    render 'edit'
    end

  end

  def destroy
    @post_shop = PostShop.find(params[:id])
    @post_shop.destroy
    redirect_to '/shops'
  end

  def destroy_all
  end

  def new
    @post_shop = PostShop.new


  end

  private
  def post_shop_params
    params.require(:post_shop).permit(:image, :area_id, :name, :introduction, :is_active,:customer_id)
  end



  def ensure_current_customer
    @post_shop = PostShop.find(params[:id])
    unless @post_shop.customer == current_customer
    redirect_to("/shops")
    end
  end




end
