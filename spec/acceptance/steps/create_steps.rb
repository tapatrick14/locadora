step "I fill an a form correctly" do
  @title = "Title_1"
  @genre = "Genre_1"
end

step "I give add movie" do
  @movie = Movie.create({title: @title, genre: @genre})
end

step "the is created" do
  @movie.reload
  expect(@movie.title).to eq("Title_1")
  expect(@movie.genre).to eq("Genre_1")
end 