# homework1_v3 (OOP)
# Rock-paper-scissors game
class Player  
  attr_accessor :name 
  def initialize(name)
    @name = name
  end
end
#--------------------------------------------------#
# Human player
# Let player choose his or her throw
class Human < Player
  def get_throw
    # Check the input
    begin
      input = gets.chomp.upcase 
    end while !["R", "P", "S"].include?(input)
    @input = input
  end
end
#--------------------------------------------------#
# Non-player character(NPC)
# Make NPC randomly choose its throw.
class NPC < Player   
  def get_throw
    input = ["R", "P", "S"].shuffle!.last
  end
end
#--------------------------------------------------#
# RPS Game
class RPS

  # Initialize
  def initialize
    intro
    get_inputs
  end

  # Show the intro & game rules
  def intro
    puts "|====================================|"
    puts "|  WELCOME TO ROCK PAPER SCISSORS!   |"               
    puts "|====================================|"
    puts "| Choose your throw. Enter: R / P / S|"
    puts "| R (Rock)                           |"
    puts "| P (Paper)                          |"
    puts "| S (Scissors)                       |"
    puts "|------------------------------------|"
  end

  # Get inputs
  def get_inputs
    test_player = Human.new("Test Player")
    test_npc = NPC.new("Test NPC")

    player_input = test_player.get_throw
    npc_input = test_npc.get_throw
    
    game(player_input, npc_input)
  end

  # Game results
  def game(player_input, npc_input)
    # Tie
    if player_input == npc_input
      result = "tie"
    # Win
    elsif (player_input == "R" && npc_input == "S")||(player_input == "P" && npc_input == "R")||(player_input == "S" && npc_input == "P") 
      result = "win"
    # Lose
    else
      result = "lose"
    end
    show_message(player_input, npc_input, result)
    continue?  
  end

  # Show game result
  def show_message(player_input, npc_input, result)  
    # Print inputs
    puts "You: #{player_input}"
    puts "NPC: #{npc_input}"
    # Result: tie / win / lose
    case result
      when "tie" then puts "TIE"
      when "win" then puts "YOU WIN"
      when "lose" then puts "YOU LOSE"
    end
  end  

  # Ask the player if he or she want to continue or not.
  def continue?
      begin
        puts "PLAY AGAIN? Y / N"
        continue = gets.chomp.upcase
      end while !["Y" , "N"].include?(continue)

      if continue == "N"
        exit
      else
        intro
        get_inputs
      end
  end

end
# -------------------- MAIN --------------------
game = RPS.new