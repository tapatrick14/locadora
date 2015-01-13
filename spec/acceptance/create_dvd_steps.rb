step "I fill the form correctly dvd" do
  @volume = 2
end

step "I give add dvd" do
  @dvd = Dvd.create(volume: @volume)
end

step "The new dvd is created" do
  @dvd.reload
  expect(@dvd.volume).to eq(2)
end
