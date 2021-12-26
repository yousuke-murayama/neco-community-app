class WantedsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def show
    @wanted = Wanted.find(params[:id])
    
    @count_cooperating = @wanted.cooperations.count
  end

  def new
    @wanted = current_user.wanteds.build
  end

  def create
    @wanted = current_user.wanteds.build(wanted_params)
    if @wanted.save
      flash[:success] = '提出しました'
      redirect_to @wanted
    else
      flash[:danger] = '提出できませんでした'
      render :new
    end
  end

  def destroy
    @wanted.destroy
    flash[:success] = '捜索願を取り消しました'
    redirect_to root_url
  end
  
  private
  
  def wanted_params
    params.require(:wanted).permit(:image, :title, :date, :content, :address, :latitude, :longitude)
  end
  
  def correct_user
    @wanted = current_user.wanteds.find_by(id: params[:id])
    unless @wanted
      redirect_to root_url
    end
  end
  
end
