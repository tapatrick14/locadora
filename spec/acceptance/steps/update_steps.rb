step "I have a movie" do
  @movie = Movie.create({title: "Title_01", genre: "Genre_01"})
end

step "I fill in a form with new attributes" do
  :hash_movie = {title: "Title_02", genre: "Genre_02"}
end

step "I give Edit in a movie" do
  put :update, id: @movie, movie: hash_movie
end

step "the movie is modify" do
  @movie.reload
  @movie.title.should eq("Title_02")
  @movie.genre.should eq("Genre_02")
end