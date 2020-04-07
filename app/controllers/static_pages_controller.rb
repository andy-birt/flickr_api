class StaticPagesController < ApplicationController

  def index
    begin
      flickr = Flickr.new
      @photos = params[:user_id] ? flickr.photos.search(user_id: params[:user_id]) : flickr.photos.getRecent
    rescue Flickr::FailedResponse => e
      puts "#{e.msg}"
    end
  end

end
