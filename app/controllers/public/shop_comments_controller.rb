class Public::ShopCommentsController < ApplicationController

  def index
    # @shop_comments = ShopComment.where(customer_id: current_customer.id)
    @shop_comments = ShopComment.all
  end

  def update
  end

  def show

  end

  def new
    @shop_comment = ShopComment.new
    # @shop_comment.save
    # redirect_to '/shops'
  end


  def create
    @ShopComment_count = ShopComment.where(post_shop_id: params[:post_shop_id]).where(customer_id: current_customer.id).count

    @shop_comment = ShopComment.new(shop_comment_params)

    @shop_comment.customer_id = current_customer.id


    if @ShopComment_count < 1
      @shop_comment.save
      redirect_to shop_comments_path
    else
      redirect_to shops_path
      flash[:notice]= "レビューの投稿は一度までです"
    end
  end

  def destroy
    shop_comment = ShopComment.find(params[:id])
    shop_comment.destroy
    redirect_to '/my_page'
  end
  private
  def shop_comment_params
    params.require(:shop_comment).permit(:title, :learn, :about, :category, :rate,:post_shop_id,:comment)
  end

end
