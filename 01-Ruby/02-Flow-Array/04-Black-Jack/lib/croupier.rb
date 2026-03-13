require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  # TODO: return (not print!) a message containing the player's score and bank's score
  return "Player score is: #{player_score}, Bank score is: #{bank_score}"
end

def end_game_message(player_score, bank_score)
  # TODO: return (not print!) a message telling if the user won or lost.
  return "You lose!" if player_score > 21 || bank_score > player_score
  return "Black Jack" if player_score == 21
  return "Push" if player_score == bank_score
  return "It's a tie!" if player_score == bank_score
  return "You win!" if player_score > bank_score
end
