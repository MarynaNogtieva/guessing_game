# frozen_string_literal: true

# Main point to start playing guessing game
class Main
  def self.run
    new.play_game
  end

  def play_game
    loop do
      max_attempts = 5
      attempts = 0
      print_interface('Welcome! Shall we play the game? [y/n]')
      input = user_input
      break if input != 'y'

      number = magic_number
      guess = user_guess

      until guessed_number?(number, guess)
        attempts += 1
        guess = user_guess

        if attempts >= max_attempts
          puts 'Exceeded maximum number of attempts.'
          break
        end

      end
    end
  end

  private

  def guessed_number?(number, guess)
    try_guess(number, guess)
  end

  def try_guess(number, guess)
    if guess > number
      print_interface('Guess lower')
      false
    elsif guess < number
      print_interface('Guess higher')
      false
    else
      print_interface('You guessed correctly')
      true
    end
  end

  def user_guess
    print_interface('Enter a number from 0 to 100')
    guess  = guess_number
    guess  = 0 if guess.nil?

    guess
  end

  def user_input
    gets&.chomp&.downcase
  end

  def magic_number
    rand(0..100)
  end

  def guess_number
    gets&.chomp&.to_i
  end

  def print_interface(words)
    puts words
  end
end
