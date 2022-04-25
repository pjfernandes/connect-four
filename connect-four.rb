require 'matrix'

class ConnectFour

  attr_accessor :board

  def initialize
    @board = Matrix[["-", "-", "-", "-", "-", "-"],
                    ["-", "-", "-", "-", "-", "-"],
                    ["-", "-", "-", "-", "-", "-"],
                    ["-", "-", "-", "-", "-", "-"],
                    ["-", "-", "-", "-", "-", "-"],
                    ["-", "-", "-", "-", "-", "-"],
                    ["-", "-", "-", "-", "-", "-"]]
  end

  def game
    puts "GAME STARTED!"
  end

  def player1_move
    display_board
    print "COL: "
    col = gets.chomp.to_i
    if @board.column(col).all? { |x| x == "-" }
      @board[6, col] = "X"
    else
      if @board[5, col] == "-"
        @board[5, col] = "X"
      elsif @board[4, col] == "-"
        @board[4, col] = "X"
      elsif @board[3, col] == "-"
        @board[3, col] = "X"
      elsif @board[2, col] == "-"
        @board[2, col] = "X"
      elsif @board[1, col] == "-"
        @board[1, col] = "X"
      elsif @board[0, col] == "-"
        @board[0, col] = "X"
      else
        puts "INVALID MOVE"
      end
    end
    display_board
  end

   def player2_move
    display_board
    print "COL: "
    col = gets.chomp.to_i
    if @board.column(col).all? { |x| x == "-" }
      @board[6, col] = "O"
    else
      if @board[5, col] == "-"
        @board[5, col] = "O"
      elsif @board[4, col] == "-"
        @board[4, col] = "O"
      elsif @board[3, col] == "-"
        @board[3, col] = "O"
      elsif @board[2, col] == "-"
        @board[2, col] = "O"
      elsif @board[1, col] == "-"
        @board[1, col] = "O"
      elsif @board[0, col] == "-"
        @board[0, col] = "O"
      else
        puts "INVALID MOVE"
      end
    end
    display_board
  end


  def player1_win?
  end

  def display_board
    i = 0
    7.times do
      puts @board.row(i)
      i += 1
    end
  end

end

g = ConnectFour.new
g.display_board
