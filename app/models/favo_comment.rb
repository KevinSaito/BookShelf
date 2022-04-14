class FavoComment < ApplicationRecord
  belongs_to :user
  belongs_to :favo_image
  
  has_many :notifications, dependent: :destroy
end
