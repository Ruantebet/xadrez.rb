class ChessGame
  def initialize
    @board = Array.new(8) { Array.new(8, ' ') }
    setup_board
    @current_player = 'white'
  end

  def play
    loop do
      display_board
      puts "#{@current_player.capitalize}'s turn."
      move_piece
      @current_player = (@current_player == 'white') ? 'black' : 'white'
    end
  end

  private

  def setup_board
    # Setup initial pieces for white
    @board[0] = ['R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R']
    @board[1] = ['P', 'P', 'P', 'P', 'P', 'P', 'P', 'P']

    # Setup initial pieces for black
    @board[7] = ['r', 'n', 'b', 'q', 'k', 'b', 'n', 'r']
    @board[6] = ['p', 'p', 'p', 'p', 'p', 'p', 'p', 'p']
  end

  def display_board
    puts "   A B C D E F G H"
    puts "  +----------------"
    @board.each_with_index do |row, index|
      puts "#{8 - index} | #{row.join(' ')} |"
    end
    puts "  +----------------"
  end

  def move_piece
    puts "Enter the position of the piece you want to move (e.g., 'A2'):"
    from = get_position

    puts "Enter the destination position (e.g., 'A4'):"
    to = get_position

    if valid_move?(from, to)
      move_piece!(from, to)
      puts "Piece moved successfully!"
    else
      puts "Invalid move! Try again."
      move_piece
    end
  end

  def get_position
    input = gets.chomp.upcase
    col = input[0].ord - 'A'.ord
    row = 8 - input[1].to_i
    [row, col]
  end

  def valid_move?(from, to)
    # TODO: Implement logic to check if the move is valid
    # (based on the piece's rules, collision with other pieces, etc.)
    true
  end

  def move_piece!(from, to)
    @board[to[0]][to[1]] = @board[from[0]][from[1]]
    @board[from[0]][from[1]] = ' '
  end
end

ChessGame.new.play

