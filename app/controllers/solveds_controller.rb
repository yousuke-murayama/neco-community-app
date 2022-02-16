class SolvedsController < ApplicationController
  
  before_action :require_logged_in
  
  def create
    @wanted = Wanted.find(params[:wanted_id])
    current_user.solve(@wanted)
    flash[:success] = "解決!!"
    redirect_back(fallback_location: root_path)
  end

end
