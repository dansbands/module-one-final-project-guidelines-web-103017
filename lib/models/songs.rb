class Song < ActiveRecord::Base
  has_many :setlist_songs
  has_many :setlists, through: :setlist_songs

  def find_by_title(title)
    self.all.select do |song|
      song.title == title
    end
  end

  def self.find_setlists(title)
    song = self.find_by_title(title)
    song.setlists
  end
# create new song
# whiskey = Song.create(title: "Whiskey Before Breakfast")

# find setlists containing existing song
# blackberry = Song.all.first
# blackberry.setlists
#
#   list songs in the first of those setlists
#   blackberry.setlists.first.songs
end
