
def draw_board(board)
  system('clear')   # Clear console on *nix
  system('cls')     # Clear console on windows
  puts "\n\t     |     |     "
  draw_row(board, 1)
  puts "\t_____|_____|_____"
  puts "\t     |     |     "
  draw_row(board, 2)
  puts "\t_____|_____|_____"
  puts "\t     |     |     "
  draw_row(board, 3)
  puts "\t     |     |     \n\n"
end

def draw_row(board, row)
  puts "\t  #{draw_position(board, (row*3)-2)}  |  #{draw_position(board, (row*3)-1)}  |  #{draw_position(board, row*3)}"
end

def draw_position(board, num)
  board[num-1] || ' '  # Return the character for specified position, if nil, return 1 space (for formatting)
end

def set_position(board, num, player)
  if player == 1
    board[num-1] = 'X'
  elsif player == 2
    board[num-1] = 'O'
  end
end

def position_set?(board, num)
  !board[num-1].nil?
end

def init_board
  Array.new(9)
end

def get_input(msg)
  puts "~> #{msg} :"
  return gets.chomp
end

def win_condition?(board)
  win_lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  win_lines.each do |line|
    if get_position(board, line[0]) == get_position(board, line[1]) && get_position(board, line[1]) == get_position(board, line[2]) && !get_position(board, line[0]).nil?
      return true
    end
  end
  return false
end

def get_position(board, num)
  board[num-1]
end

def board_full?(board)
  !board.include?(nil)
end

def play_again?
  choices = {'y' => true, 'n' => false}
  continue = choices[get_input('Play Again? (y/n)')] until continue != nil
  return continue
end

def player_turn(board)
  player_choice = 0
  player_position_accepted = false
  until player_choice > 0 && player_choice < 10 && player_position_accepted
    player_choice = get_input('Choose an open position (1-9)').to_i
    if position_set?(board, player_choice)
      puts 'Position is already taken. Please choose another.'
    else
      player_position_accepted = true
    end
  end
  set_position(board, player_choice, 1)
  draw_board(board)
end

def computer_turn(board)
  computer_choice = Time.new.to_i # Ensure that our random numbers are unique each game
  computer_choice = rand(1..9)
  computer_choice = rand(1..9) until get_position(board, computer_choice).nil?
  set_position(board, computer_choice, 2)
  draw_board(board)
end

game_board = init_board

game_running = true

while game_running do

  draw_board(game_board)

  player_turn(game_board)
  if win_condition?(game_board)
    puts 'You Won!'
  else
    computer_turn(game_board)
    puts 'You Lose :(' if win_condition?(game_board)
  end

  puts 'Out of moves, Game is a draw!' if board_full?(game_board)

  if win_condition?(game_board) || board_full?(game_board)
    game_board = init_board
    game_running = play_again?
  end

end