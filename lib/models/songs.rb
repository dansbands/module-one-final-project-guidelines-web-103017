class Song < ActiveRecord::Base
  has_many :setlist_songs
  has_many :setlists, through: :setlist_songs

# create new song
# whiskey = Song.create(title: "Whiskey Before Breakfast")

# find setlists containing existing song 
# blackberry = Song.all.first
# blackberry.setlists
#
#   list songs in the first of those setlists
#   blackberry.setlists.first.songs
end
