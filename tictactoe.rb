def display board
  print board[0],board[1],board[2],"\n"
  print board[3],board[4],board[5],"\n"
  print board[6],board[7],board[8],"\n"
end

def playermove board,count
  puts "Enter a position on the board:"
  move = gets.chomp
  if board.include? move.to_i
    board.map!{ |x| x == move.to_i ? 'X' : x }
  else
    puts "Invalid move try again"
    display board
    playermove board,count
  end
  display board
  win board,'X'
  count = count + 1
  cats count
  computermove board,count
end

def computermove board,count
  move = rand(0..9)
  if board.include? move.to_i
    board.map!{ |x| x == move.to_i ? 'O' : x }
  else
    computermove board,count
  end
  puts "Computers Turn"
  display board
  win board,'O'
  count = count + 1
  cats count
  playermove board,count
end

def play
  count = 0
  board = [0,1,2,3,4,5,6,7,8]
  display board
  playermove board,count
end

def win board, player
  if board[0] == board[1] && board[1] == board[2] && board[0]==player
    print player," is the winner"
    abort
  end
  if board[0] == board[3] && board[3] == board[6] && board[0]==player
    print player," is the winner"
    abort
  end
  if board[0] == board[4] && board[4] == board[8] && board[0]==player
    print player," is the winner"
    abort
  end
  if board[1] == board[4] && board[4] == board[7] && board[1]==player
    print player," is the winner"
    abort
  end
  if board[2] == board[4] && board[4] == board[6] && board[2]==player
    print player," is the winner"
    abort
  end
  if board[2] == board[5] && board[5] == board[8] && board[2]==player
    print player," is the winner"
    abort
  end
  if board[3] == board[4] && board[4] == board[5] && board[3]==player
    print player," is the winner"
    abort
  end
  if board[6] == board[7] && board[7] == board[8] && board[6]==player
    print player," is the winner"
    abort
  end
end

def cats count
  if count>=9
    puts "Cats Game"
    abort
  end
end

play
