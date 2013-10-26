class Game
  Scores = [0, 15, 30, 40]

  def initialize player1, player2
    @player1, @player2 = player1, player2
    @scores = { @player1 => 0, @player2 => 0 }
  end

  def leading_player
    score1, score2 = @scores[@player1], @scores[@player2]
    return if score1 == score2

    score1 > score2 ? @player1 : @player2
  end

  def deuce?(score1, score2)
    score1 >= 3 && score2 >=3 && score1 == score2
  end
 
  def score
    score1, score2 = @scores[@player1], @scores[@player2]

    # Win.
    if (score1 > 3 || score2 > 3) && (score1 - score2).abs >= 2
      return "#{leading_player.name} wins!"
    end

    # Deuce.
    if deuce?(score1, score2)
      return "deuce"
    end

    # Advantage.
    if score1 >= 3 && score2 >= 3 && (score1 - score2).abs == 1
      return "#{leading_player.name}'s advantage"
    end
    
    # None of the above.
    "#{score_representation(@player1)}:#{score_representation(@player2)}"
  end

  def score_representation player
    balls_won = @scores[player]
    Scores[balls_won]
  end

  def player_won_the_ball player
    @scores[player] += 1
  end
end

class Player
  attr_reader :name
  def initialize name
    @name = name
  end

  def score game
    game.player_won_the_ball self
  end
end
