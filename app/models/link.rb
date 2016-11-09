class Link < ApplicationRecord
  belongs_to :user
  belongs_to :brand

  validates :url, presence: true
end
