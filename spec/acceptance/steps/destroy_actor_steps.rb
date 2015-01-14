step "I have a actor to delete" do
  @actor = Actor.create({true_name: "True_name_1", artistic_name: "Artistic_name_1", date_birth: "Date_birth_1"})
end

step "I give a Destroy in the actor" do
  Actor.destroy(@actor.id)
end

step "the actor is deleted" do
  expect(Actor.find_by(id: @actor.id)).to eq(nil)
end
