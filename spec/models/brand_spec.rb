require 'rails_helper'

RSpec.describe Brand, type: :model do
	context 'validations' do
		it {should validate_presence_of :name}
	end

	context 'associations' do
		it {should have_many(:links)}
		it {should have_many(:links).dependent(:destroy)}
	end
end
