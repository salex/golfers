class GolferController < ApplicationController

  def index
    @golfer = Golfer.new(id:1)

    redirect_to root_path, notice:"Got a golfer #{@golfer.inspect}"
  end
end