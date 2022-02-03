class CooperationsController < ApplicationController
  
  before_action :require_logged_in
  
  def create
    @wanted = Wanted.find(params[:wanted_id])
    current_user.cooperate(@wanted)
    
    set_count
    
    render :cooperation
  end

  def destroy
    @wanted = Wanted.find(params[:wanted_id])
    current_user.not_cooperate(@wanted)
  
    set_count
    
    render :cooperation
  end
  
  private
  
  def set_count
    @count_cooperating = @wanted.cooperations.count
  end
  
end
