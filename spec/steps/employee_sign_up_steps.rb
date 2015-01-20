step "There is a employee" do
  @employee = Employee.create({name: "Fernando", address: "Rua Nova", job: "Caixa", cpf: "12345678", salary: "500", email: "fernando@email.com", password: "147258369", password_confirmation: "147258369"})
end

step "I click in Sign Up" do
  visit("employees/sign_up")
end

step "I filled new employee form correctly" do
  fill_in 'Name', with: 'Fernando'
  fill_in 'Address', with: 'Rua Nova'
  fill_in 'Job', with: 'Caixa'
  fill_in 'Cpf', with: '123456789'
  fill_in 'Salary', with: '500'
  fill_in 'Email', with: 'fernando@email.com'
  fill_in 'Password', with: '147258369'
  fill_in 'Password confirmation', with: '147258369'
  click_button 'Sign up'
end

step "I filled new employee form incorrectly" do
  fill_in 'Name', with: ''
  fill_in 'Address', with: 'Rua Nova'
  fill_in 'Job', with: 'Caixa'
  fill_in 'Cpf', with: '123456789'
  fill_in 'Salary', with: '500'
  fill_in 'Email', with: ''
  fill_in 'Password', with: ''
  fill_in 'Password confirmation', with: ''
  click_button 'Sign up'
end

step "I filled new employee form incorrectly in the field password confirmation" do
  fill_in 'Name', with: 'Fernando'
  fill_in 'Address', with: 'Rua Nova'
  fill_in 'Job', with: 'Caixa'
  fill_in 'Cpf', with: '123456789'
  fill_in 'Salary', with: '500'
  fill_in 'Email', with: 'teste@email.com'
  fill_in 'Password', with: '147258369'
  fill_in 'Password confirmation', with: '11111111'
  click_button 'Sign up'
end

step "I should see the home page" do
  expect(page).to have_content("Locadora")
end

step "I should see the sign up page again with the errors" do
  expect(page).to have_content("errors")
end

step "I should see error message" do
  expect(page).to have_content("Password confirmation doesn't match Password")
end