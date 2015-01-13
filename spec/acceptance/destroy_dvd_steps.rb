step "I have a dvd to delete" do
  @dvd = Dvd.create({volume: 1})
end

step "I give a destroy in the dvd" do
  Dvd.destroy(@dvd.id)
end

step "The dvd is deleted" do
  expect(Dvd.find_by(id: @dvd.id)).to eq(nil)
end
