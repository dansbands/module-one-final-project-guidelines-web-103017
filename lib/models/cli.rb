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

  def main_menu
    prompt_user
    input = get_user_input
    if input == "1"
      puts "Enter a title for your new setlist"
      title = get_user_input
      setlist = Setlist.create(name: title)
      puts "Created new setlist '#{title}'"
      add_songs(setlist)
    elsif input == "2"
      view_setlists
    elsif input.upcase == "M"
      start
    else
      invalid_selection
    end
  end

# can I just use add_songs here?
  def view_setlists
    puts "Here are the existing setlists:"
    setlists = Setlist.all.each do |list|
      puts "#{list.id}. #{list.name}"
    end
    choose_setlist
    # create more main_menus Here
      # delete setlist
      # remove song from setlist
      # find setlists by song name
  end

  def choose_setlist
    puts "Choose a setlist by number from the list above:"
    setlist_id = get_user_input
    choice = Setlist.all.find do |list|
      list.id.to_s == setlist_id
    end
    puts "Setlist '#{choice.id} - #{choice.name}'"
    puts "Songs:"
    ordered_setlist_songs = choice.setlist_songs.order(:order).each {|sl| puts "#{sl.order}. #{sl.song.title}"}
    add_songs_to_setlist(choice) # does this still work properly, or do we need to pass in ordered_setlist_songs?
  end

  def invalid_selection
    puts "Invalid selection"
    main_menu
  end

  def pick_a_song_by_number(setlist)
    # needs to loop back if invalid input
    puts "Pick a song by number:"
    Song.all.each do |song|
        puts "#{song.id}. #{song.title}"
    end
    input = get_user_input
    song = Song.all.select do |song|
      song.id.to_s == input
    end.first
    # setlist.songs << song # does the method work without this? - Yes, it actually adds duplicates, but that gives length for increment
    setlistsong = SetlistSong.create(order: setlist.songs.length + 1, song_id: song.id, setlist_id: setlist.id)

    updated_setlist(song, setlist)
    # binding.pry
  end

  def updated_setlist(song, setlist)
    order = setlist.songs.length + 1
    puts "Added '#{song.title}' to '#{setlist.name}' at position '#{order}'."
    puts "Here's your updated setlist '#{setlist.name}':"
    new_list = Setlist.all.select do |item|
      item == setlist
    end.first
    # new_list = new_list.first
    count = 1
    new_list.songs.each do |song|
      puts "#{count}. #{song.title}"
      count += 1
    end
  end

  # can i reuse this method in view_setlists
  def add_songs_to_setlist(setlist)
    input = ""
    while input != "1" || input != "2" || input.upcase != "M"

      puts "Add Song - Would you like to:
        1. Create a new song
        2. Choose from existing songs
        'M' - Main Menu"

      input = get_user_input
      if input == "1"
        # create a new song
        add_a_song(setlist)
      elsif input == "2"
        #  choose from existing songs
        pick_a_song_by_number(setlist)

      elsif input.upcase == "M"
        start
      end
    end
  end

  def add_songs(setlist)
    if setlist.list_songs == [] # is there a method for list_songs? Yes, in setlist class
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
      add_songs_to_setlist(setlist)
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
    order = song.setlist_songs.length + 1 # may not need the increment

    setlistsong = SetlistSong.create(order: order, song_id: song_id, setlist_id: setlist_id)
    # binding.pry
    updated_setlist(song, setlist)
    # puts "Added '#{song.title}' to '#{setlist.name}' at position '#{order}'."
    # puts "Here's your updated setlist:"
    # new_list = Setlist.all.select do |item|
    #   item == setlist
    # end.first
    # # new_list = new_list.first
    # count = 1
    # new_list.songs.each do |song|
    #   puts "#{count}. #{song.title}"
    #   count += 1
    # end
    add_another_song(setlist)
  end

  def add_another_song(setlist)
    input = ""
    while input != "1" || input != "2" || input.upcase != "M"
      puts "Choose an Option:
            1. Add Another Song to This Setlist
            2. View All Setlists"
      input = get_user_input
      if input == "1"
        add_songs_to_setlist(setlist)
      elsif input == "2"
        view_setlists
      elsif input.upcase == "M"
        start
      end
    end
  end

  def start
    welcome
    main_menu
  end

  def goodbye
    puts "Thanks for using Setlist Organizer."
    puts "Goodbye!"
    exit
  end
end
