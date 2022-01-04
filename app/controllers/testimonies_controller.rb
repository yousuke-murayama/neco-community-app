class TestimoniesController < ApplicationController
  before_action :require_logged_in
  
  def create
    @testimony = current_user.testimonies.build(testimony_params)
    
    if @testimony.save
      flash[:success] = "送信しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "送信に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Testimony.find_by(id: params[:id], wanted_id: params[:wanted_id]).destroy
    flash[:success] = "削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def testimony_params
    params.require(:testimony).permit(:content, :photo, :wanted_id)
  end
  
  def correct_testimony
    @testimony = current_user.testimonies.find_by(id: params[:id])
    unless @testimony
      redirect_to root_url
    end
  end
end
