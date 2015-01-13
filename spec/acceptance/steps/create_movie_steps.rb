step "I fill an a form correctly" do
  @title = "Title_1"
  @genre = "Genre_1"
end

step "I give add movie" do
  @movie = Movie.create({title: @title, genre: @genre})
end

step "the movie is created" do
  @movie.reload
  expect(@movie.title).to eq("Title_1")
  expect(@movie.genre).to eq("Genre_1")
end 

step "I created a actor" do
  send "I fill an a form"
  send "I give add actor"
  send "the actor is created"
end

step "I deleted a actor" do
  send "I have a actor to delete"
  send "I give a Destroy in the actor"
  send "the actor is deleted"
end

step "I updated a actor" do
  send "I have a actor to modify"
  send "I fill in a form with new attributes the actor"
  send "I give Edit in the actor"
  send "the actor is modify"
end