class LinksController < ApplicationController

  def index
    @link = Link.new
    @links = current_user.links
  end

  def create
    link = Link.new(link_params)
    link.user = current_user
    if link.save
      flash[:success] = "Successfully created #{link.title}"
      redirect_to links_path
    else
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
