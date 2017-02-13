class LinksController < ApplicationController

  def index
    @links = current_user.links
  end

  def method_name

  end

end
