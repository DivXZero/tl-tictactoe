
def draw_board(board)
  puts "\t     |     |     "
  puts "\t  #{draw_position(board, 1)}  |  #{draw_position(board, 2)}  |  #{draw_position(board, 3)}  "
  puts "\t_____|_____|_____"
  puts "\t     |     |     "
  puts "\t  #{draw_position(board, 4)}  |  #{draw_position(board, 5)}  |  #{draw_position(board, 6)}  "
  puts "\t_____|_____|_____"
  puts "\t     |     |     "
  puts "\t  #{draw_position(board, 7)}  |  #{draw_position(board, 8)}  |  #{draw_position(board, 9)}  "
  puts "\t     |     |     "
end

def draw_position(board, num)
  num -= 1  #Offset for the array
  board[num] || ' '  #Return the character for specified position, if nil, return 1 space (for formatting)
end

def init_board
  Array.new(9)
end

game_board = init_board

draw_board(game_board)