class Brand < ApplicationRecord
	has_many :links, dependent: :destroy
end
