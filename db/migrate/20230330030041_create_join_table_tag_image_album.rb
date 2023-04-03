class CreateJoinTableTagImageAlbum < ActiveRecord::Migration[7.0]
  def change
    create_table :image_albums_tags do |t|
      
       t.bigint "image_album_id"
    t.bigint "tag_id"
    end
    add_index :image_albums_tags, :tag_id
    add_index :image_albums_tags, :image_album_id
  end
end
