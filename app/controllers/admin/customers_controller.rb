class Admin::CustomersController < ApplicationController
  before_action  :authenticate_admin!
  def index
    @customers = Customer.page(params[:page])
    @shop_comments = ShopComment.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :nickname, :email, :is_deleted)
  end
end
