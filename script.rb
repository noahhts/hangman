# frozen_string_literal: true

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
puts correct_word.join(' ')

incorrect_guesses = 7
puts "You have up to #{incorrect_guesses} incorrect guesses"
