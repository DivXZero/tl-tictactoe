
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

game_board = init_board

draw_board(game_board)

# Get Player Choice
player_choice = 0
until player_choice > 0 && player_choice < 10
  player_choice = get_input('Choose a position (1-9)').to_i
end

set_position(game_board, player_choice, 1)

draw_board(game_board)