class Brand < ApplicationRecord
	has_many :links, dependent: :destroy

	validates :name, presence: true

	default_scope {order("name ASC")}
end
