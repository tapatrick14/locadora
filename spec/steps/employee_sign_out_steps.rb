step "I'm logged into the system" do
  visit("/employees/sign_in")
  fill_in 'Email', with: 'joao@email.com'
  fill_in 'Password', with: '147258369'
  click_button 'Log in'
end


step "I click in Sign out buttom" do
  click_link 'Sign out'
end

step "I should see the log in page" do
  expect(page).to have_content("Log in")
end