step "I have a movie to delete" do
  @movie = Movie.create({title: "Title_01", genre: "Genre_01"}
end

step "I give a Destroy in the movie" do
  delete :destroy, id: @movie
end

step "the movie is deleted" do
  @movie.reload
  @movie.title.should_not eq("Title_01")
  @movie.genre.should_not eq("Genre_01")
end
