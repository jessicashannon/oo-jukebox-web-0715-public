class Jukebox

  def initialize(songs)
    @songs = songs
  end

  def call
    puts  "1. `help` - Lists all commands a user can type./n
          2. `list` - Lists all of the songs./n
          3. `play` - Play a song by its name or number. /n
          4. `exit` - This exists the program."
  end

  def ask_for_input
    @input = gets.downcase.chomp
  end

  def choice
    case @input
      when "1", "help"
        help
      when "2", "list"
        list
      when "3", "play"
        puts "Which song would you like to play?"
        ask_for_input
        choice
      when @input.include?("play")
        play
      when "4", "exit"
        abort("Thanks for using Jukebox!")
    end
  end

  def help
    call
  end

  def list
    puts @songs.each_with_index{|s, i| "#{i}. #{s}"}
  end

  def prompt_again
    puts "Which song would you like to play?"
  end

  def play(opt_arg=nil)
    @input = opt_arg if opt_arg != nil
    cleanup_input
    if @input.length < 2
      @input = @input.to_i
      play_song_from_index
    elsif @songs.include?(@input)
      play_song_by_name
    else
      puts "I didn't understand that."
      prompt_again
    end
  end

  def cleanup_input
    @input = @input.downcase.chomp
  end

  def play_song_from_index
    puts "/Now Playing: #{@songs[@input]}/"
  end

  # def play_song_by_name
  #   puts "/Now Playing: #{@songs.select{|s| s.downcase.include?(@input)}.first}/"
  # end
end
















