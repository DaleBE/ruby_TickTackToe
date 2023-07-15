class Grid
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

  def check_row(arr, player)
    arr.map do |line|
      if line.all?(player)
        return true
      end
    end
    false
  end

  def check_col(player)
    first_col = [@playing_grid[0][0], @playing_grid[1][0], @playing_grid[2][0]]
    second_col = [@playing_grid[0][1],  @playing_grid[1][1], @playing_grid[2][1]]
    third_col = [@playing_grid[0][2], @playing_grid[1][2], @playing_grid[2][2]]

    if first_col.all?(player)
      true
    elsif second_col.all?(player)
      true
    elsif third_col.all?(player)
      true
    else
      false
    end
  end

  def check_diagonal(player)
    right_diagonal = [@playing_grid[0][0], @playing_grid[1][1], @playing_grid[2][2]]
    left_diagonal = [@playing_grid[0][2], @playing_grid[1][1], @playing_grid[2][0]]

    if right_diagonal.all?(player)
      true
    elsif left_diagonal.all?(player)
      true
    else
      false
    end
  end
end

class GamePlay

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

game_board = Grid.new

game_board.display_grid

puts "#{player_one} Please choose a number to place your token on:"
choice = gets.chomp!

game_board.update_grid(choice, 'X')
game_board.display_grid

puts "#{player_two} Please choose a number to place your token on:"
choice = gets.chomp!

game_board.update_grid(choice, 'O')
game_board.display_grid