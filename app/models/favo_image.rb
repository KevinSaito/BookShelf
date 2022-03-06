class FavoImage < ApplicationRecord
  has_one_attached :image
  #validates :image, presence: true
  belongs_to :user
  
  def get_image
    if image.attached?
      image
    else
      'no_image1.jpg'
    end
  end
end
