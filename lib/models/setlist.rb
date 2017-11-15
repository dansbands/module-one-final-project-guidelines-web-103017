class Setlist < ActiveRecord::Base
  has_many :setlist_songs
  has_many :songs, through: :setlist_songs

  def list_songs
    self.songs 
  end
# create new setlist
# set3 = Setlist.create(name: "Set 3")

# add songs to existing setlist
  #
  # create variable of a setlist instance
  # set1 = Setlist.all.first
  #
    # list setlist_songs in setlist
    # set1.setlist_songs

    # list songs in setlist
    # set1.songs

    # get title of a song in setlist through setlist_songs
    # set1.setlist_songs.first.song
end
