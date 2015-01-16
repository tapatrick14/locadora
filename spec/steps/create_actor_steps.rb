step 'I visted the cadastre page to actor' do
  visit('/actors/new')
end

step 'I filled out form of the actor correctly' do
  fill_in 'actor_true_name', with: 'True Name_01'
  fill_in 'actor_artistic_name', with: 'Artistic Name_01'
  select '1956', from: 'actor_birth_1i'
  select 'July', from: 'actor_birth_2i'
  select '3', from: 'actor_birth_3i'
  click_button 'CONFIRM'
end

step 'I should see a sign in success message of the actor' do
  expect(page).to_not have_selector("#error_explanation")
end