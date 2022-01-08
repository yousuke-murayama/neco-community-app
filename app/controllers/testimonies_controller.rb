class TestimoniesController < ApplicationController
  before_action :require_logged_in
  before_action :correct_testimony, only: [:destroy]
  
  def create
    @testimony = current_user.testimonies.build(testimony_params)
    
    @wanted = Wanted.find_by(id: @testimony.wanted_id)
    
    @testimonies = @wanted.testimonies
    
    if @testimony.save
      render :create
    else
      render :error
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
