class LinksController < ApplicationController

  def index
    @link = Link.new
    @links = current_user.links
  end

  def create
    link = Link.new(link_params)
    link.user = current_user
    if !link.valid_url?
      flash[:danger] = "Please provide a valid url"
      redirect_to links_path
    elsif link.save
      flash[:success] = "Successfully created #{link.title}"
      redirect_to links_path
      publish_link(link)
    else
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def publish_link(link)
    pub = Publisher.new
    pub.publish_to_queue(link)
  end

end
