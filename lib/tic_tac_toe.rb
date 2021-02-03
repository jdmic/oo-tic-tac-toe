require "pry"
class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize 
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input = input.to_i
        index = input - 1
    end

    def move(index, token="X")
        @board[index] = token
    end 

    def position_taken?(index)
        if @board[index] == " "|| @board[index] == nil||@board[index] == ""
            false
        else
            true
        end
    end

    def valid_move?(index)
        if index.between?(0, 8)
            if !position_taken?(index)
                true
            end
        else
            false
        end
    end

    def turn
        puts "Pick a spot between 1-9."
        current_player
        input = gets
        index = input_to_index(input)
        if valid_move?(index)
            move(index, token="X")
            display_board
        else
            puts "invalid"
            input = gets
        end
    end

    def turn_count
        count = 0
        @board.each do |element|
            if element != " "
                count += 1
            end
        end
        count
    end

    def current_player
        if turn_count%2==0
            "X"
        else
            "O"
        end
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
            first = combo[0]
            second = combo[1]
            third = combo[2]
            if @board[first]!=" "&&@board[second]!=" "&&@board[third]!=" "&&@board[first]==@board[second] && @board[second]==@board[third] 
                return combo
            end
        end
        false
    end

    def full?
        if @board[0]!=" "&&@board[1]!=" "&&@board[2]!=" "&& @board[3]!=" "&&@board[4]!=" "&&@board[6]!=" "&&@board[7]!= " "&&@board[8]!=" "
            true
        else
            false
        end
    end

    def draw?
        #binding.pry
        if full? == won?.kind_of?(Array)
            return false
        else 
            true
        end
    end

    def over?
        if full?
            true
        elsif won?.kind_of?(Array)
            true
        else
            false
        end
    end

    def winner
        if won?.kind_of?(Array)
            move = current_player
            if move == "X"
                return "O"
            elsif move == "O"
                return "X"
            end
        else 
            return nil
        end
    end

    def play
        until winner.kind_of?(String)
             turn
             over?
             winner
        end
        
    end
end