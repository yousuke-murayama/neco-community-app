class RoomsController < ApplicationController
  before_action :require_logged_in
  
  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true).order(id: :desc).page(params[:page]).per(20)
  end

  def show
    @room = Room.find(params[:id])
    @comments = @room.comments
    @comment = current_user.comments.build
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = 'トークルームを作成しました'
      redirect_to @room
    else
      flash[:danger] = '作成に失敗しました'
      render :new
    end
  end

  def destroy
  end
  
  private
  
  def room_params
    params.require(:room).permit(:title)
  end
  
end
