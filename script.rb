# frozen_string_literal: true

puts 'Play Hangman!'

dict = File.read('google-10000-english-no-swears.txt').split

def select_word(dict)
  prng = Random.new
  word = ''
  word_length = 0
  while word_length < 5 || word_length > 12
    word = dict[prng.rand(dict.length)]
    word_length = word.length
  end
  word
end

correct_word = select_word(dict).split('')
correct_word.each do
  print '_ '
end
print "\n"

incorrect_guesses = 7
puts "You have up to #{incorrect_guesses} incorrect guesses"

corrects = []
incorrects = []
victory = false

while incorrect_guesses.positive?
  print 'Guess a letter: '

  guess = gets.chomp.downcase
  incorrect = true
  victory = true

  correct_word.each_with_index do |letter, index|
    puts ' ' if index.zero?
    if guess == letter
      print "#{letter} "
      incorrect = false
    elsif corrects.include?(letter)
      print "#{letter} "
    else
      print '_ '
      victory = false
    end
  end
  print "\n\n"
  if incorrect
    incorrects << guess
    incorrect_guesses -= 1
  else
    corrects << guess
  end

  break if victory

  puts "Incorrect guesses: #{incorrects} (#{incorrect_guesses} remaining)"
  puts ' '
end

if victory
  puts 'You win!'
else
  puts 'You lose'
  puts "It was: #{correct_word.join}"
end
