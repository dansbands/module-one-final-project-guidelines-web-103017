# require_relative '../lib/models/setlist.rb'
# require_relative '../lib/models/songs.rb'
# require_relative '../lib/models/user.rb'
require_relative '../config/environment.rb'

# Do I need destroys???

User.create(name: 'Dan')

Song.create(title: 'Blackberry Blossom')
Song.create(title: 'Billy in the Lowground')
Song.create(title: 'Monroe\'s Hornpipe')

Setlist.create(name: 'Set 1')
Setlist.create(name: 'Set 2')


SetlistSong.create(order: 1, song_id: 1, setlist_id: 1)
SetlistSong.create(order: 2, song_id: 2, setlist_id: 1)
SetlistSong.create(order: 1, song_id: 3, setlist_id: 2)
SetlistSong.create(order: 2, song_id: 1, setlist_id: 2)
