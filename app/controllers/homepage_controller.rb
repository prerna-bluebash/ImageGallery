class HomepageController < ApplicationController
  def index
    @image_albums= ImageAlbum.all.where(published: true)
    @q =  @image_albums.ransack(params[:q])
    @image_albums = @q.result
  end
end
