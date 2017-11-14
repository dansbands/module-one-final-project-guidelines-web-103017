class AddSongsAndSetlists < ActiveRecord::Migration
  def change
    add_column :setlist_songs, :song_id, :integer
    add_column :setlist_songs, :setlist_id, :integer
  end
end
