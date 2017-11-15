class SetlistSong < ActiveRecord::Base
  belongs_to :songs
  belongs_to :setlists

end
