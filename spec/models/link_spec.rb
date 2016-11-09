require 'rails_helper'

RSpec.describe Link, type: :model do 

	context 'validations' do
		it {should validate_presence_of :url}
	end

	context 'associations' do 
		it {should belong_to(:user)}
		it {should belong_to(:brand)}
	end
end