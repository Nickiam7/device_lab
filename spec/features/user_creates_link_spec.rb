require 'rails_helper'

RSpec.feature "User creates a link", type: :feature do 

	scenario "Successfully" do
		user = create(:user, id: 1)
		link = create(:link, brand_id: 3)

		visit new_user_session_path

		sign_in(user.email, user.password)

		expect(current_path).to eq(user_path(1))
		expect(page).to have_content "Signed in successfully."
		expect(page).to have_css("h2", text: "Hello #{user.username}")
		click_link "Create new link"

		expect(current_path).to eq(new_link_path)
		expect(page).to have_css("h2", text: "Create a new link")
		fill_in "Url", with: link.url
		fill_in "Title", with: link.title
		fill_in "Brand", with: link.brand
		click_button "Send link to device lab"

		expect(current_path).to eq(user_path(user))
		expect(page).to have_content(link.url)
	end

	scenario "Unsuccessfully" do
		user = create(:user, id: 1)
		link = build(:link, url: "", brand_id: 3)

		visit new_user_session_path

		sign_in(user.email, user.password)

		expect(current_path).to eq(user_path(1))
		expect(page).to have_content "Signed in successfully."
		expect(page).to have_css("h2", text: "Hello #{user.username}")
		click_link "Create new link"

		expect(current_path).to eq(new_link_path)
		expect(page).to have_css("h2", text: "Create a new link")
		click_button "Send link to device lab"

		expect(current_path).to eq(links_path)
	end

	private

	def sign_in(email, password)
		fill_in "Email", with: email
		fill_in "Password", with: password
		click_button "Sign in"
	end
end