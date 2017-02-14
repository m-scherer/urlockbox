class Api::V1::LinksController < ApplicationController

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
      publish_user(current_user)
      publish_link(@link)
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:read)
  end


    def publish_link(link)
      pub = Publisher.new
      pub.publish_link_to_queue(link)
    end

    def publish_user(user)
      pub = Publisher.new
      pub.publish_user_to_queue(user)
    end

end
