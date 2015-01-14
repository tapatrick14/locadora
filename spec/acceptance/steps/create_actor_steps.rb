step "I fill an a form" do
  @true_name = "True_name_1"
  @artistic_name = "Artistic_name_1"
  @date_birth = "Date_birth_1"
end

step "I give add actor" do
  @actor = Actor.create({true_name: @true_name, artistic_name: @artistic_name, date_birth: @date_birth})
end

step "the actor is created" do
  @actor.reload
  expect(@actor.true_name).to eq("True_name_1")
  expect(@actor.artistic_name).to eq("Artistic_name_1")
  expect(@actor.date_birth).to eq("Date_birth_1")
end 