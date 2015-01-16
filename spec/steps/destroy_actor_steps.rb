step "give I have a actor" do
  @actor = Actor.create({true_name: 'True Name_01', artistic_name: 'Artistic Name_01', birth: '2000-04-01'})
end

step "I visted the show page of the actor to delete" do
  visit('/actors/' + @actor.id.to_s)
end

step "I chossed the actor to delete" do
  first(:link, "DELETE").click
end

step "Confirm if I want to delete the actor" do
  page.driver.browser.accept_js_confirms
end

step "the actor is deleted" do
  expect(page).to_not have_selector("#NEW ACTOR")
end

step "Confirm if I dont want to delete the actor" do
  page.driver.browser.reject_js_confirms
end

step "the actor isnt deleted" do
  expect(page).to_not have_selector("#ACTORS")
end