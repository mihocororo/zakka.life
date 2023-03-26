class Public::PostRoomsController < ApplicationController
  def index
    @post_rooms = PostRoom.all

  end

  def update
    @post_room = PostRoom.find(params[:id])
    if @post_room.update(post_room_params)
    redirect_to rooms_path
    else
    render 'edit'
    end
  end

  def destroy
    @post_room = PostRoom.find(params[:id])
    @post_room.destroy
    redirect_to '/rooms'
  end

  def create
    @post_room = PostRoom.new(post_room_params)
    @post_room.customer_id = current_customer.id

    if @post_room.save
      redirect_to rooms_path(@post_room)
    else
      render :new
    end


  end
  def edit
    @post_room = PostRoom.find(params[:id])
  end

  def destroy_all
  end

  def new
    @post_room = PostRoom.new
  end
   private
  def post_room_params
    params.require(:post_room).permit(:name, :comment, :image,:customer_id)
  end

before_action :ensure_current_user, {only: [:edit, :update]}
  def ensure_current_user
     redirect_to("/rooms")
  end


end
