class SetlistSong < ActiveRecord::Base
  belongs_to :song #needs to be singular
  belongs_to :setlist

end
