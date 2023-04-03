class ImageAlbumsController < ApplicationController

  before_action :authenticate_user!
  def index
    @image_albums = current_user.image_albums

  end

  def show
    @image_album = ImageAlbum.find(params[:id])

  end

  def new
    @image_album = current_user.image_albums.new
  end

  def create 
    
    @image_album = current_user.image_albums.new(image_album_params)
    if @image_album.save
      
      redirect_to @image_album
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @image_album = current_user.image_albums.find(params[:id])
      rescue
       @response='You cannot Edit this Album!'
      end
      
  end

  def update
    @image_album = ImageAlbum.find(params[:id])
    if @image_album.update(image_album_params)
      redirect_to @image_album
    end
    
  end

  def destroy
    @image_album = current_user.image_albums.find(params[:id])
    if @image_album.destroy
      redirect_to root_path
    end
   
  end
  
  def purge_image
    @image_album = current_user.image_albums.find(params[:id])
    @image = @image_album.images.find(params[:image_id])
    @image.purge
    redirect_to @image_album, notice: "Image deleted successfully"
  end

  def update_image
    @image_album = current_user.image_albums.find(params[:id])
    @image = @image_album.images.find(params[:image_id])
  end

  private 
  def image_album_params
    params.require(:image_album).permit(:title, :description, :published, :thumbnail, :all_tags, images: [])
  end


end