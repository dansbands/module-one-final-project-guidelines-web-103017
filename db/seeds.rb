# require_relative '../lib/models/setlist.rb'
# require_relative '../lib/models/songs.rb'
# require_relative '../lib/models/user.rb'
require_relative '../config/environment.rb'

# Do I need destroys???

dan = User.create(name: 'Dan')

blackberry = Song.create(title: 'Blackberry Blossom')
billy = Song.create(title: 'Billy in the Lowground')
monroes = Song.create(title: 'Monroe\'s Hornpipe')

set1 = Setlist.create(name: 'Set 1')
set2 = Setlist.create(name: 'Set 2')


setlistsong1 = SetlistSong.create(order: 1, song_id: 1, setlist_id: 1)
setlistsong2 = SetlistSong.create(order: 2, song_id: 2, setlist_id: 1)
setlistsong3 = SetlistSong.create(order: 1, song_id: 3, setlist_id: 2)
setlistsong4 = SetlistSong.create(order: 2, song_id: 1, setlist_id: 2)
