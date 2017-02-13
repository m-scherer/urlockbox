class Link < ActiveRecord::Base
  belongs_to :user

  def valid_url?
    uri = URI.parse(uri) && !uri.host.nil?
    rescue URI::InvalidURIError
      false
  end

end
