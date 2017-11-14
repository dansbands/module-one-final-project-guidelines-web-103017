class Setlist < ActiveRecord::Base
  has_many :songs, through: :setlist_songs

end
