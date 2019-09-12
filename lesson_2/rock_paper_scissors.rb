VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

def prompt(msg)
  puts "=> #{msg}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock')
end

def announce_winner(p_wins, c_wins)
  if p_wins == 5
    prompt("You won the game!")
  elsif c_wins == 5
    prompt("The computer won the game!")
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this round!")
  elsif win?(computer, player)
    prompt("You lost this round!")
  else
    prompt("It's a tie!")
  end
end

def convert_choice(c)
  case c
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    'rock'
  when 'sp'
    'spock'
  when 'l'
    'lizard'
  end
end

loop do
  choice = ''
  player_wins = 0
  computer_wins = 0
  round_number = 1

  loop do
    loop do
      prompt("Round #{round_number}")
      prompt("Choose one: rock(r), paper(p), scissors(s), spock(sp), lizard(l)")
      choice = gets.chomp.downcase

      if choice.length < 3
        choice = convert_choice(choice)
      end

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    puts("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_wins += 1
    elsif win?(computer_choice, choice)
      computer_wins += 1
    end

    break if player_wins == 5 || computer_wins == 5

    round_number += 1
    prompt("Your Wins: #{player_wins}")
    prompt("Computer Wins: #{computer_wins}")
  end

  announce_winner(player_wins, computer_wins)
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing!")
