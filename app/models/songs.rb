class Song < ActiveRecord::Base
  has_many :setlists, through: :setlist_songs

end
