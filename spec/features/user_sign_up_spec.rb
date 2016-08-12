require 'rails_helper'

RSpec.feature "User sign up", type: :feature do

	context "Users create device lab account" do

		scenario "Successful sign up" do
			visit '/users/sign_up'
			
			expect(page).to have_content 'Create your device lab account'

			fill_in "Username", with: 'test_user'
			fill_in "Email", with: 'test@email.com'
			password_and_password_confirmation
			click_button "Sign up"

			expect(current_path).to eq user_path(current_user)
			expect(page).to have_content "Welcome #{current_user.username}"
		end

	end

	private
	def password_and_password_confirmation
		fill_in "Password", with: 'test@email.com'
		fill_in "Password confirmation", with: 'test@email.com'
	end
end		