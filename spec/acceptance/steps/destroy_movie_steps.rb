step "I have a movie to delete" do
  @movie = Movie.create({title: "Title_1", genre: "Genre_1"})
end

step "I give a Destroy in the movie" do
  Movie.destroy(@movie.id)
end

step "the movie is deleted" do
  expect(Movie.find_by(id: @movie.id)).to eq(nil)
end
