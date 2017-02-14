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
    else
      render :index
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(link_id)
    new_link = Link.new(link_params)
    if !new_link.valid_url?
      flash[:danger] = "Please provide a valid url"
      redirect_to edit_link_path(edit)
    elsif link.update(link_params)
      flash[:success] = "Successfully updated #{link.title}"
      redirect_to links_path
    else
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def link_id
    params.permit(:id)[:id]
  end

end
