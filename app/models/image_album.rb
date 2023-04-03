class ImageAlbum < ApplicationRecord
    after_create :send_album_creation_email
    belongs_to :user
    has_one_attached :thumbnail
    has_many_attached :images
    has_and_belongs_to_many :tags

    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "description", "id", "integer", "published", "title", "updated_at", "user_id", "all_tags"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["images_attachments", "images_blobs", "tags", "thumbnail_attachment", "thumbnail_blob", "user"]
    end
  
    def all_tags
      tags.map(&:alltags).join(", ")
    end

    def all_tags=(alltags)
      self.tags = alltags.split(",").map do |n|
        Tag.where(alltags: n.strip).first_or_create!
      end
    end

    def send_album_creation_email
        UserMailer.album_creation_email(self).deliver_later
    end
end