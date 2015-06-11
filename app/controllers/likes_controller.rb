class LikesController < ApplicationController

  def create
    @like = Like.create()
  end

end
