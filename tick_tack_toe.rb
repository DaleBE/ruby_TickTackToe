class Grid
  attr_reader :playing_grid

  def initialize
    @playing_grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def display_grid
    @playing_grid.each { |line| puts line.join(' ') }
  end

  def update_grid(choice, player_token)
    case choice
    when '1'
      @playing_grid[0][0] = player_token
    when '2'
      @playing_grid[0][1] = player_token
    when '3'
      @playing_grid[0][2] = player_token
    when '4'
      @playing_grid[1][0] = player_token
    when '5'
      @playing_grid[1][1] = player_token
    when '6'
      @playing_grid[1][2] = player_token
    when '7'
      @playing_grid[2][0] = player_token
    when '8'
      @playing_grid[2][1] = player_token
    when '9'
      @playing_grid[2][2] = player_token
    else
      puts 'ERROR'
    end
  end

  def check_row(player_token)
    @playing_grid.map do |line|
      if line.all?(player_token)
        return true
      end
    end
    false
  end

  def check_col(player_token)
    first_col = [@playing_grid[0][0], @playing_grid[1][0], @playing_grid[2][0]]
    second_col = [@playing_grid[0][1],  @playing_grid[1][1], @playing_grid[2][1]]
    third_col = [@playing_grid[0][2], @playing_grid[1][2], @playing_grid[2][2]]

    if first_col.all?(player_token)
      true
    elsif second_col.all?(player_token)
      true
    elsif third_col.all?(player_token)
      true
    else
      false
    end
  end

  def check_diagonal(player_token)
    right_diagonal = [@playing_grid[0][0], @playing_grid[1][1], @playing_grid[2][2]]
    left_diagonal = [@playing_grid[0][2], @playing_grid[1][1], @playing_grid[2][0]]

    if right_diagonal.all?(player_token)
      true
    elsif left_diagonal.all?(player_token)
      true
    else
      false
    end
  end
end

class GamePlay
  attr_reader :player_one, :player_two

  def initialize(player_one, player_two)
    @game_grid = Grid.new
    @playing_grid = @game_grid.playing_grid
    @player_one = { name: player_one, token: 'X' }
    @player_two = { name: player_two, token: 'O' }
  end

  def make_choice(player)
    puts "#{player[:name]} Please choose a number to place your token on:"
    gets.chomp!
  end

  def place_token(choice, player)
    if @playing_grid.flatten.include?(choice.to_i)
      @game_grid.update_grid(choice, player[:token])
    else
      puts 'Sorry that is an invalid choice.'
      make_choice(player)
    end
  end

  def check_for_win(player)
    if @game_grid.check_row(player[:token]) || @game_grid.check_col(player[:token]) || @game_grid.check_diagonal(player[:token])
      'win'
    elsif @playing_grid.flatten.none?(Integer)
      'tie'
    else
      false
    end
  end

  def player_one_turn
    @game_grid.display_grid

    choice = make_choice(@player_one)

    place_token(choice, @player_one)

    if check_for_win(@player_one) == 'win'
      puts "Congratulations #{@player_one[:name]}! You are the Tick Tack Toe WIZARD!!"
    elsif check_for_win(@player_one) == 'tie'
      puts 'Sorry USERs, no one wins this round'
    else
      player_two_turn
    end
  end

  def player_two_turn
    @game_grid.display_grid

    choice = make_choice(@player_two)

    place_token(choice, @player_two)

    if check_for_win(@player_two) == 'win'
      puts "Congratulations #{@player_two[:name]}! You are the Tick Tack Toe WIZARD!!"
    elsif check_for_win(@player_two) == 'tie'
      puts 'Sorry USERs, no one wins this round'
    else
      player_one_turn
    end
  end

end

greeting = <<~GREET # syntax for a multiline string that removes whitespaces
  TICK-TACK-TOE

  Welcome USERs to this exciting game of tick-tack-toe!

  A game where two players compete for the glory of becoming the Tick-Tack-Toe Wizard!
  Each player chooses a free space, indicated by a number, in which to place their token.
  If a player's tokens make a LINE in a row, column or on the diagonal they win the game.
  Get your game hats on and let's play!

GREET

puts greeting

puts 'Player One, what is your name?'
player_one = gets.chomp!

puts 'Player Two, what is your name?'
player_two = gets.chomp!

puts "#{player_one} your token will be X"
puts "#{player_two} your token will be O"

start_game = GamePlay.new(player_one, player_two)

start_game.player_one_turn
