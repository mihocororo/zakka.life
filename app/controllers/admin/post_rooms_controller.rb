class Admin::PostRoomsController < ApplicationController
  before_action  :authenticate_admin!
  def show
    @post_room = PostRoom.find(params[:id])
  end

  def destroy
    @post_room = PostRoom.find(params[:id])
    @post_room.destroy
    redirect_to '/admin/post_rooms'
  end

  def update
  end

  def index
    @post_rooms = PostRoom.all

  end
end
