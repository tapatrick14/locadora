step "There is a employee to login" do
  @employee = Employee.create({name: "Joao", address: "Rua Nova", job: "Caixa", cpf: "12345678", salary: "500", email: "joao@email.com", password: "147258369", password_confirmation: "147258369"})
end

step "I filled correctly with the login" do
  visit("employees/sign_in")
  fill_in 'Email', with: 'joao@email.com'
  fill_in 'Password', with: '147258369'
end

step "I filled incorrectly with the login" do
  visit("employees/sign_in")
  fill_in 'Email', with: 'joao@email.com'
  fill_in 'Password', with: '11111111'
end

step "I click in Log in buttom" do
  click_button 'Log in'
end

step "I should see the home page with the user name" do
  expect(page).to have_content("Locadora")
end

step "I should see the login page again" do
  expect(page).to have_content("Log in")
end