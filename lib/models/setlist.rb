class Setlist < ActiveRecord::Base
  has_many :setlist_songs
  has_many :songs, through: :setlist_songs

end
