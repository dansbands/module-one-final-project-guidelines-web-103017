class CLI
  def welcome
    puts "Welcome to the Setlist Organizer"
  end

  def prompt_user
    puts "Choose an Option:"
    puts "1. Create a Setlist"
    puts "2. View Existing Setlists"
  end

  def get_user_input
    input = gets.chomp
    input == "exit" ? goodbye : input
  end

  def option
    prompt_user
    input = get_user_input
    if input == "1"
      puts "Enter a title for your new setlist"
      title = get_user_input
      setlist = Setlist.create(name: title)
      puts "Created new setlist '#{title}'"
      add_songs(setlist)
    elsif input == "2"
      option_2
    else
      invalid_selection
    end
  end

# can I just use add_songs here?
  def option_2
    puts "Here are the existing setlists:"
    setlists = Setlist.all.each do |list|
      puts "#{list.id}. #{list.name}"
    end
    choose_setlist
  end

  def choose_setlist
    puts "Choose a setlist by number from the list above:"
    setlist = get_user_input
    choice = Setlist.all.select do |list|
      list.id.to_s == setlist
    end
    puts "Setlist #'#{choice.first.id} - #{choice.first.name}'"
    puts "Songs:"
    choice.first.songs.each do |song|
      puts "#{song.id}. #{song.title}"
    end
  end

  def invalid_selection
    puts "Invalid selection"
    option
  end

# can i reuse this method in option_2
  def add_songs(setlist)
    if setlist.list_songs == []
      puts "There are no songs in your setlist"
    else
      puts "Here are the songs in this setlist"
      puts setlist.list_songs
    end
    puts "Would you like to add a song?(Y/N)"
    input = get_user_input
    yes_no(input, setlist)
  end

  def yes_no(input, setlist)
    if input.upcase == 'Y'
      add_a_song(setlist)
    elsif input.upcase == 'N'
      goodbye
    else
      add_songs(setlist)
    end
  end

  def add_a_song(setlist)
    puts "Enter the title of the song:"
    title = get_user_input
    song = Song.create(title: title)
    puts "Created new song '#{title}'"
    song_id = song.id
    setlist_id = setlist.id
    order = setlist.songs.length + 1
    setlistsong = SetlistSong.create(order: order, song_id: song_id, setlist_id: setlist_id)
    puts "Added '#{song.title}' to '#{setlist.name}' at position '#{order}'."
    puts "Here's your updated setlist:"
    new_list = Setlist.all.select do |item|
      item == setlist
    end
    new_list = new_list.first
    count = 1
    new_list.songs.each do |song|
      puts "#{count}. #{song.title}"
      count += 1
    end
    puts "Choose an Option:
          1. Add Another Song to This Setlist
          2. View All Setlists"
    input = get_user_input
    if input == "1"
      add_a_song(setlist)
    elsif input == "2"
      option_2
    end
  end

  def start
    welcome
    option
  end

  def goodbye
    puts "Thanks for using Setlist Organizer."
    puts "Goodbye!"
    exit
  end
end
