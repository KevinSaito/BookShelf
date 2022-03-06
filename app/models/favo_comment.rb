class FavoComment < ApplicationRecord
  belongs_to :user
  belongs_to :favo_image
end
