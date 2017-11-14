class SetlistSong < ActiveRecord::Base
  has_many :songs
  has_many :setlists

end
