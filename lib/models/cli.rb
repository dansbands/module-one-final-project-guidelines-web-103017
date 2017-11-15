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
    gets.chomp
  end

  def option
    prompt_user
    input = get_user_input

    if input == "1"
      valid_selection = true
      puts "Enter a title for your new setilst"
      title = get_user_input
      setlist = Setlist.create(name: title)
      puts "Created new setlist '#{title}'"
      add_songs(setlist)
    elsif input == "2"
      valid_selection = true
      puts "Here are the existing setlists:"
      setlists = Setlist.all.each do |list|
        puts "#{list.id}. #{list.name}"
      end


    else
      invalid_selection
    end
  end

  def invalid_selection
    puts "Invalid selection"
    option
  end

  def yes_no(input)
    if input.upcase == 'Y'
      add_a_song
    elsif input.upcase == 'N'
      goodbye
    else
      add_songs
    end
  end

  def add_songs(setlist)
    if setlist.list_songs == []
      puts "There are no songs in your setlist"
    else
      puts "Here are the songs in this setlist"
      puts setlist.list_songs
    end
    puts "Would you like to add a song?(Y/N)"
    input = get_user_input
    yes_no(input)
  end

  def add_a_song
    puts "Enter the title of the song:"
    title = get_user_input
    song = Song.create(title)
    puts "Created new song #{title}"

  end

  def start
    welcome
    option
  end

  def goodbye
    puts "Thanks for using Setlist Organizer."
    puts "Goodbye!"
  end
end
