def sign_in_as! user
  visit '/'
  click_link "Login"
  fill_in "Username", with: user.username
  fill_in "Password", with: user.password
  click_button "Login"
  expect(page).to have_content("Logout")
end