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
      puts "Enter a title for your new setilst"
      title = get_user_input
      Setlist.create(title)
    elsif input == "2"
      setlists = Setlist.all 
      puts "Here are the existing setlists:"
      puts setlists

    end
  end

  def start
    welcome
    option
  end
end
