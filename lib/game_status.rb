require 'pry'

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.find do |win_arr|
    if board[win_arr[0]] =="X"
      win_arr.all? {|i| board[i] == "X"}
    elsif board[win_arr[0]] =="O"
      win_arr.all? {|i| board[i] == "O"}
    end
  end
end

def full?(board)
  board.all? {|i| i != " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  board[won?(board)[0]] if over?(board) && !draw?(board)
end
