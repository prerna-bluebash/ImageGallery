class AddUserIdToImageAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :image_albums, :user_id, :string
   
  end
end
