step "I have a actor to modify" do
  @actor_01 = Actor.create({true_name: "True_name_1", artistic_name: "Artistic_name_1", date_birth: "Date_birth_1"})
end

step "I fill in a form with new attributes the actor" do
  @actor_02 = ({true_name: "True_name_2", artistic_name: "Artistic_name_2", date_birth: "Date_birth_2"})
end

step "I give Edit in the actor" do
  Actor.update(@actor_01.id, @actor_02)
end

step "the actor is modify" do
  expect(Actor.find_by(id: @actor_01.id, true_name: "True_name_2")).to_not eq(nil)
end

step "I modifly a actor" do
  send "I have a actor to modify"
  send "I fill in a form with new attributes the actor"
  send "I give Edit in the actor"
  send "the actor is modify"
end