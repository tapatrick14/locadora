step "I fill in a form correctly" do
  :hash_movie = {title: "Title_01", genre: "Genre_01"}
end

step "I give add in the new movie" do
  @movie = Movie.create(hash_movie)
end

step "the movie is create" do
  @movie.reload
  @movie.title.should eq("Title_01")
  @movie.genre.should eq("Genre_01")
end