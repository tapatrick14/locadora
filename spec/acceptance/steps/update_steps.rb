step "I have a movie to modify" do
  @movie_01 = Movie.create({title: "Title_1", genre: "Genre_1"})
end

step "I fill in a form with new attributes" do
  @movie_02 = ({title: "Title_2", genre: "Genre_2"})
end

step "I give Edit in the movie" do
  Movie.update(@movie_01.id, @movie_02)
end

step "the movie is modify" do
  expect(Movie.find_by(id: @movie_01.id, title: "Title_2")).to_not eq(nil)
end