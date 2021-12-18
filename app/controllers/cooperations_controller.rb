class CooperationsController < ApplicationController
  
  before_action :require_logged_in
  
  def create
    wanted = Wanted.find(params[:wanted_id])
    current_user.cooperate(wanted)
    flash[:success] = "捜査に協力しました！"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    wanted = Wanted.find(params[:wanted_id])
    current_user.not_cooperate(wanted)
    flash[:success] = "捜査協力を辞退しました"
    redirect_back(fallback_location: root_path)
  end
  
end
