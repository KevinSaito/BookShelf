class FavoImage < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true
  validates :location, presence:true
  validates :caption, presence:true
  belongs_to :user
  has_many :favo_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  image.variant(resize_to_limit: [width, height]).processed
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  # DB検索用の設定
  def self.search(keyword)
    where(["location like? OR caption like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
