step "give I have a actor" do
  @actor = Actor.create({true_name: 'True Name_01', artistic_name: 'Artistic Name_01', birth: '2000-01-01'})
end

step "I visted the show page of the actor to update" do
  visit('/actors/' + @actor.id.to_s)
end

step "I chossed the actor to update" do
  first(:link, "UPDATE").click
end

step "I fill in a form of the actor with new attributes" do
  fill_in 'actor_true_name', with: 'True Name_02'
  fill_in 'actor_artistic_name', with: 'Artistic Name_01'
  select '1990', from: 'actor_birth_1i'
  select 'April', from: 'actor_birth_2i'
  select '1', from: 'actor_birth_3i'
  click_button 'CONFIRM'
end

step "the actor is modify with success" do
  expect(page).to_not have_selector("#error_explanation")
end