# step "I have a dvd to modify" do
#   @dvd_1 = Dvd.create({volume: 2})
# end

# step "I fill in a form with new attribute of dvd" do
#   @dvd_2 = Dvd.create({volume: 3})
# end

# step "I give Edit in the dvd" do
#   Dvd.update(@dvd_1.id, @dvd_2)
# end

# step "The dvd is modified" do
#   expect(Dvd.find_by(id: @dvd_1.id, volume: 3)).to_not eq(nil)
# end