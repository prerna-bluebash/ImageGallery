class Tag < ApplicationRecord
  has_and_belongs_to_many :image_albums

  def self.ransackable_attributes(auth_object = nil)
    ["alltags", "created_at", "id", "updated_at"]
  end
end
