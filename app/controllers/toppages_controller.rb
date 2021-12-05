class ToppagesController < ApplicationController
  def index
    @wanteds = Wanted.all
  end
end
