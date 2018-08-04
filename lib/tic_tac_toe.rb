class TicTacToe
  
  def initialize(board = Array.new(9, " "))
    @board = board
  end
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(entry)
     @index = entry.to_i - 1
  end
  
  def move(entry, current_player="X")
    @board[entry] = current_player
  end
  
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
     index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    user_entry = gets.strip.to_i - 1
  
     if valid_move?(entry) 
      move(user_entry,current_player(@board))
      display_board
    else
      until valid_move?(user_entry) do
       puts "That is not a valid move. Please enter 1-9:"
        user_entry = gets.strip.to_i - 1
      end
      move(user_entry,current_player(@board))
      display_board
  end
end

  def turn_count
    counter = 0 
    @board.each do |entry|
      if entry != " "
        counter += 1
      end
    end
    return counter
  end
  
  
  def current_player
    player_turn = turn_count + 1
  
    if player_turn % 2 == 0 
      return "O"
    else
      return "X"
    end
  end
  
end