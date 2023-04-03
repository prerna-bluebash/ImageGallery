class AddPublishedToImageAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :image_albums, :published, :boolean
  end
end
