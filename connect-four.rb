require 'matrix'

class ConnectFour

  attr_reader :board

  def initialize
    @board = Matrix[["-", "-", "-", "-", "-", "-","-"],
                    ["-", "-", "-", "-", "-", "-","-"],
                    ["-", "-", "-", "-", "-", "-","-"],
                    ["-", "-", "-", "-", "-", "-","-"],
                    ["-", "-", "-", "-", "-", "-","-"],
                    ["-", "-", "-", "-", "-", "-","-"]]
  end

  def game
    puts "GAME STARTED!"

    until player1_row_win? || player2_row_win? || player1_col_win? || player2_col_win?
      player1_move
      player2_move
    end

    puts "GAME FINISHED!"
  end

  def player1_move
    display_board
    print "COL: "
    col = gets.chomp.to_i
    if @board.column(col).all? { |x| x == "-" }
      @board[5, col] = "X"
    else
      if @board[4, col] == "-"
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
      @board[5, col] = "O"
    else
      if @board[4, col] == "-"
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


  def player1_row_win?
    result = nil
    for row in 0...6
      row_matrix = @board.row(row).to_a
      result_sub = ["X","X","X","X"]
      if row_matrix.each_cons(result_sub.size).any?(&result_sub.method(:==))
        result = true
        break
      else
        result = false
      end
    end
    result
  end

  def player1_col_win?
    result = nil
    for col in 0...7
      col_matrix = @board.column(col).to_a
      result_sub = ["X","X","X","X"]
      if col_matrix.each_cons(result_sub.size).any?(&result_sub.method(:==))
        result = true
        break
      else
        result = false
      end
    end
    result
  end

  def player2_row_win?
    result = nil
    for row in 0...6
      row_matrix = @board.row(row).to_a
      result_sub = ["O","O","O","O"]
      if row_matrix.each_cons(result_sub.size).any?(&result_sub.method(:==))
        result = true
        break
      else
        result = false
      end
    end
    result
  end

  def player2_col_win?
    result = nil
    for col in 0...7
      col_matrix = @board.column(col).to_a
      result_sub = ["O","O","O","O"]
      if col_matrix.each_cons(result_sub.size).any?(&result_sub.method(:==))
        result = true
        break
      else
        result = false
      end
    end
    result
  end

  def display_board
    i = 0
    7.times do
      puts @board.row(i)
      i += 1
    end
  end

end
