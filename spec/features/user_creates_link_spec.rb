require 'rails_helper'

RSpec.feature "User creates a link", type: :feature do 

	scenario "Successfully" do
		user = create(:user, id: 1)

		visit new_user_session_path

		sign_in(user.email, user.password)

		expect(current_path).to eq(user_path(1))
		expect(page).to have_content "Signed in successfully."
		expect(page).to have_css("h2", text: "Hello #{user.username}")
		click_link "Create new link"

		expect(current_path).to eq(new_link_path)
		expect(page).to have_css("h2", text: "Create a new link")
		click_button "Send link to device lab"

		link = create(:link)
		expect(current_path).to eq(user_path(link.user_id))
		expect(page).to have_content(link.url)
	end

	xit scenario "Unsuccessfully" do
		user = create(:user, id: 1)

		visit new_user_session_path

		sign_in(user.email, user.password)

		expect(current_path).to eq(user_path(1))
		expect(page).to have_content "Signed in successfully."
		expect(page).to have_css("h2", text: "Hello #{user.username}")
		click_button "Create new link"

		expect(current_path).to eq(new_link_path)
		expect(page).to have_css("h2", text: "Create a new link")
		click_button "Send link to device lab"

		link = build(:link)

		expect(current_path).to eq(new_link_path)
	end

	private

	def sign_in(email, password)
		fill_in "Email", with: email
		fill_in "Password", with: password
		click_button "Sign in"
	end
end