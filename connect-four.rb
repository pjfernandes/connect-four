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

    until player1_row_win? || player2_row_win? || player1_col_win? || player2_col_win? || player1_diagonal_win? || player2_diagonal_win?
      player1_move
      player2_move
    end

    puts "GAME FINISHED!"
  end

  def player1_move
    display_board
    print "COL: "
    col = gets.chomp.to_i

    if valid_move?(col) == false
      puts "INVALID MOVE"
      until valid_move?(col)
        print "COL: "
        col = gets.chomp.to_i
      end
    end

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
      col = gets.chomp
      if valid_move?(col) == false
        puts "INVALID MOVE"
        until valid_move?(col)
          print "COL: "
          col = gets.chomp.to_i
        end
      end
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

  def player1_row_win?
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

  def player1_diagonal_win?
    sub_matrices =
      [
        [
          @board[0,3],
          @board[1,2],
          @board[2,1],
          @board[3,0]
        ],
        [
          @board[0,4],
          @board[1,3],
          @board[2,2],
          @board[3,1],
          @board[4,0]
        ],
        [ @board[0,5],
          @board[1,4],
          @board[2,3],
          @board[3,2],
          @board[4,1],
          @board[5,0]
        ],
        [ @board[0,5],
          @board[1,4],
          @board[2,3],
          @board[3,2],
          @board[4,1],
          @board[5,0]
        ],
        [
          @board[0,6],
          @board[1,5],
          @board[2,4],
          @board[3,3],
          @board[4,2],
          @board[5,1]
        ],
        [
          @board[1,6],
          @board[2,5],
          @board[3,4],
          @board[4,3],
          @board[5,2]
        ],
        [
          @board[2,6],
          @board[3,5],
          @board[4,4],
          @board[5,3]
        ],
        [
          @board[2,0],
          @board[3,1],
          @board[4,2],
          @board[5,3],
        ],
        [
          @board[1,0],
          @board[2,1],
          @board[3,2],
          @board[4,3],
          @board[5,4]
        ],
        [
          @board[0,0],
          @board[1,1],
          @board[2,2],
          @board[3,3],
          @board[4,4],
          @board[5,5]
        ],
        [
          @board[0,1],
          @board[1,2],
          @board[2,3],
          @board[3,4],
          @board[4,5],
          @board[5,6]
        ],
        [
          @board[0,2],
          @board[1,3],
          @board[2,4],
          @board[3,5],
          @board[4,6]
        ],
        [
          @board[0,3],
          @board[1,4],
          @board[2,5],
          @board[3,6]
        ]
      ]

    result_sub = ["X","X","X","X"]
    results = []

    sub_matrices.each do |matrix|
      results << matrix.each_cons(result_sub.size).any?(&result_sub.method(:==))
    end

    results.any?(true)
  end

  def player2_diagonal_win?
    sub_matrices =
      [
        [
          @board[0,3],
          @board[1,2],
          @board[2,1],
          @board[3,0]
        ],
        [
          @board[0,4],
          @board[1,3],
          @board[2,2],
          @board[3,1],
          @board[4,0]
        ],
        [ @board[0,5],
          @board[1,4],
          @board[2,3],
          @board[3,2],
          @board[4,1],
          @board[5,0]
        ],
        [ @board[0,5],
          @board[1,4],
          @board[2,3],
          @board[3,2],
          @board[4,1],
          @board[5,0]
        ],
        [
          @board[0,6],
          @board[1,5],
          @board[2,4],
          @board[3,3],
          @board[4,2],
          @board[5,1]
        ],
        [
          @board[1,6],
          @board[2,5],
          @board[3,4],
          @board[4,3],
          @board[5,2]
        ],
        [
          @board[2,6],
          @board[3,5],
          @board[4,4],
          @board[5,3]
        ],
        [
          @board[2,0],
          @board[3,1],
          @board[4,2],
          @board[5,3],
        ],
        [
          @board[1,0],
          @board[2,1],
          @board[3,2],
          @board[4,3],
          @board[5,4]
        ],
        [
          @board[0,0],
          @board[1,1],
          @board[2,2],
          @board[3,3],
          @board[4,4],
          @board[5,5]
        ],
        [
          @board[0,1],
          @board[1,2],
          @board[2,3],
          @board[3,4],
          @board[4,5],
          @board[5,6]
        ],
        [
          @board[0,2],
          @board[1,3],
          @board[2,4],
          @board[3,5],
          @board[4,6]
        ],
        [
          @board[0,3],
          @board[1,4],
          @board[2,5],
          @board[3,6]
        ]
      ]

    result_sub = ["O","O","O","O"]
    results = []

    sub_matrices.each do |matrix|
      results << matrix.each_cons(result_sub.size).any?(&result_sub.method(:==))
    end

    results.any?(true)
  end

  def valid_move?(input)
    (input.class == Integer) && (input >= 0 && input < 6) ? true : false
  end

  def display_board
    i = 0
    7.times do
      puts @board.row(i)
      i += 1
    end
  end

end
