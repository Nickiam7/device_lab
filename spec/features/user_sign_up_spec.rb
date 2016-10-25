require 'rails_helper'

RSpec.feature "User sign up", type: :feature do

	scenario "successfully" do
		visit new_user_registration_path
		
		expect(page).to have_content "Create your device lab account"
		fill_in "Username", with: "test_user"
		fill_in "Email", with: 'test@gmail.com'
		fill_in "Password", with: '12345678'
		fill_in "Password confirmation", with: '12345678'
		click_button "Sign up"

		user = build(:user, id: 1)

		expect(current_path).to eq "/users/1"
		expect(page).to have_content "Hello #{user.username}"
	end

	context "failed" do

		before do
			visit new_user_registration_path
		end

		scenario "with missing email" do
			expect(page).to have_field("Email", with: "", type: "email")
			fill_in "Password", with: '12345678'
			fill_in "Password confirmation", with: '12345678'

			click_button "Sign up"
			expect(page).to have_content "Email can't be blank"
		end

		scenario "with missing email" do
			fill_in "Username", with: "test_user"
			expect(find_field("Password", type: "password").value).to be_nil
			expect(find_field("Password confirmation", type: "password").value).to be_nil

			click_button "Sign up"
			expect(page).to have_content "Password can't be blank"
		end

		scenario "incorrect password confirmation" do
			fill_in "Email", with: 'test@gmail.com'		
			fill_in "Password", with: "12345678"
			fill_in "Password confirmation", with: "not numbers"
			click_button "Sign up"

			expect(page).to have_content "Password confirmation doesn't match Password"
		end

		scenario "already registered email" do
			user = create(:user)

			fill_in "Email", with: user.email
			fill_in "Password", with: "12345678"
			fill_in "Password confirmation", with: "12345678"
			click_button "Sign up"

			expect(page).to have_content "Email has already been taken"
		end

		scenario "invalid email" do
			fill_in "Email", with: "invalid-email-for-testing"
			fill_in "Password", with: "12345678"
			fill_in "Password confirmation", with: "12345678"
			click_button "Sign up"

			expect(page).to have_content "Email is invalid"
		end

		scenario "too short password" do
			min_password_length = 6
			too_short_password = "p" * (min_password_length - 1)
			fill_in "Email", with: 'test@gmail.com'
			fill_in "Password", with: too_short_password
			fill_in "Password confirmation", with: too_short_password
			click_button "Sign up"

			expect(page).to have_content "Password is too short (minimum is 6 characters)"
		end
	end
end		