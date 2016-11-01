require 'rails_helper'

RSpec.feature "User sign in and out", type: :feature do

	context "Sign in" do

		scenario "successfully" do
			user = create(:user)
			
			visit new_user_session_path 

			sign_in(user.email, user.password)

			expect(current_path).to eq "/users/1"
			expect(page).to have_content "Signed in successfully."
			expect(page).to have_css("h2", text: "Hello #{user.username}")

			click_link "Sign out"

			expect(current_path).to eq new_user_session_path
			expect(page).to have_content "Signed out successfully." 
		end

		scenario "Unsuccessfully" do
			user = create(:user)

			visit new_user_session_path

			sign_in(user.email, "wrong password")

			expect(current_path).to eq new_user_session_path
			expect(page).to have_content("Invalid Email or password.")
		end
	end

	private

	def sign_in(email, password)
		fill_in "Email", with: email
		fill_in "Password", with: password
		click_button "Sign in"
	end
end	