class ToppagesController < ApplicationController
  def index
    @q = Wanted.ransack(params[:q])
    @wanteds = @q.result(distinct: true).order(id: :desc).page(params[:page]).per(12)
  end
end
