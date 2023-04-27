class Public::AreasController < ApplicationController
  def index

    @post_shops = PostShop.all
    @areas = Area.all


      @area = Area.find(params[:id])
      @post_shops = @area.post_shops

  end




   private
  def area_params
    params.require(:area).permit(:name)
  end
end
