class Tour < ApplicationRecord
  belongs_to :city

  mount_uploader :image, ImageUploader

  validates_processing_of :image
  validate :image_size_validation

  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 3.megabytes
  end
end
