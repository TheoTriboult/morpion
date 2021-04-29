class Game
  attr_accessor :grid
  attr_reader :round

  def initialize
    puts "Salut, bienvenue sur le jeu du Morpion !"
    puts "Commençons. Joueur 1, quel est ton nom ?"
    print "> "
    input_player1 = gets.chomp
    print "\n"
    puts "Super. C'est noté"
    print "\n"

    puts "Joueur 2, à ton tour ! Quel est ton nom ?"
    print "> "
    input_player2 = gets.chomp
    print "\n"
    puts "Cool. passons à la suite"

    @player1 = Player.new(input_player1)
    @player2 = Player.new(input_player2)

    gets.chomp

    puts "#{@player1.name} jouera avec le motif #{@player1.pattern = "X"}, et #{@player2.name} jouera avec le motif #{@player2.pattern = "O"}"
    puts "Le but du jeu étant d'alligner 3 motifs, verticalement, horizontalement, ou bien en diagonal, avant votre adversaire, comme ci-dessous :"
    print "\n"
    puts "Verticalement     Horizontalement     En diagonal"
    puts "|X| | |           |X|X|X|             |X| | |"
    puts "|X| | |           | | | |             | |X| |"
    puts "|X| | |           | | | |             | | |X|"
    
    gets.chomp

    puts "Pour jouer, les joueurs vont entrer, l'un après l'autre, la position de leur motif respectif"
    puts "Le positions sont les suivantes :"
    puts "|TL|TM|TR|     Top-Left        Top-Middle        Top-Right"
    puts "|ML|MM|MR|     Middle_left     Middle-Middle     Middle-Right"
    puts "|TL|TM|TR|     Bottom-Left     Bottom-Middle     Bottom-Right"

    gets.chomp

    @grid = ["| | | |",
             "| | | |", 
             "| | | |"] 
    @round = 0

  end

  # def generate_grid(size)
  #   for i in 1..size
  #     for i in 0..size
  #       print "| "
  #     end
  #     print "\n"
  #   end
  # end

  def show_grid          
    puts @grid[0]
    puts @grid[1]
    puts @grid[2]
  end

  def request_positions
    @round += 1

    @round.odd? ? player = @player1 : player = @player2
    print "\n"
    puts "#{player.name}, c'est ton tour"
    puts "Le positions sont les suivantes :"
    puts "|TL|TM|TR|"
    puts "|ML|MM|MR|"
    puts "|BL|BM|BR|"

    print "\n"
    puts "Indique la position que tu souhaites jouer"
    print "> "
    position = gets.chomp

      #Cases cell is empty
      if position == "TL" && @grid[0][1] == " " then @grid[0][1] = player.pattern
      elsif position == "TM" && @grid[0][3] == " " then @grid[0][3] = player.pattern
      elsif position == "TR" && @grid[0][5] == " " then @grid[0][5] = player.pattern
      elsif position == "ML" && @grid[1][1] == " " then @grid[1][1] = player.pattern
      elsif position == "MM" && @grid[1][3] == " " then @grid[1][3] = player.pattern
      elsif position == "MR" && @grid[1][5] == " " then @grid[1][5] = player.pattern
      elsif position == "BL" && @grid[2][1] == " " then @grid[2][1] = player.pattern
      elsif position == "BM" && @grid[2][3] == " " then @grid[2][3] = player.pattern
      elsif position == "BR" && @grid[2][5] == " " then @grid[2][5] = player.pattern
      
      #Cases cell is not empty or input is wrong
      else 
        puts "Desolé, cette case est occupée, ou bien ne correspond pas à notre jeu. Recommence !"
    end

  end

  def find_winner
    #Horizontal cases
    if @grid[0][1] == @grid[0][3] && @grid[0][1] == @grid[0][5] && @grid[0][1] != " " then @grid[0][1]
    elsif @grid[1][1] == @grid[1][3] && @grid[1][1] == @grid[1][5] && @grid[1][1] != " " then @grid[1][1]
    elsif @grid[2][1] == @grid[2][3] && @grid[2][1] == @grid[2][5] && @grid[2][1] != " " then @grid[2][1]

    #Vertical cases
    elsif @grid[0][1] == @grid[1][1] && @grid[0][1] == @grid[2][1] && @grid[0][1] != " " then @grid[0][1]
    elsif @grid[0][3] == @grid[1][3] && @grid[0][3] == @grid[2][3] && @grid[0][3] != " " then @grid[0][3]
    elsif @grid[0][5] == @grid[1][5] && @grid[0][5] == @grid[2][5] && @grid[0][5] != " " then @grid[0][5]

    #Vertical cases
    elsif @grid[0][1] == @grid[1][3] && @grid[0][1] == @grid[2][5] && @grid[0][1] != " " then @grid[0][1]
    elsif @grid[2][1] == @grid[1][3] && @grid[2][1] == @grid[0][5] && @grid[2][1] != " " then @grid[2][1]

    else false

    end
  end

  def end
    winning_pattern = find_winner
    if winning_pattern == @player1.pattern  
      winner = @player1 
      loser = @player2 
    else
      winner = @player2 
      loser = @player1
    end
    print "\n"
    puts "Félicitation #{winner.name}, tu as vaincu #{loser.name}"
  end

end
