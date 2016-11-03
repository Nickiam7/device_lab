require 'rails_helper'

RSpec.describe Link, type: :model do 

	context 'validations' do
		it {should validate_presence_of :url}
		it {should validate_presence_of :title}
		it {should validate_presence_of :brand}
	end

	context 'associations' do 
		it {should belong_to(:user)}
	end
end