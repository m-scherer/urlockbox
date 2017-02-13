class LinksController < ApplicationController

  def index
    @link = Link.new
    # @links = current_user.links
  end

  def create
    require "pry"; binding.pry
  end

end
