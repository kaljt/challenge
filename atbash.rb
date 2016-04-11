require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class Atbash
  def self.encode(string)
    final_message = []
    @alpha = ('a'..'z').to_a
    message = string.downcase.gsub(/\W/, '').split('')
    message = message.map { |letter| encode_letter(letter) }.join
    final_message << message.slice!(0, 5) until message.empty?
    final_message.join(' ')
  end

  def self.encode_letter(letter)
    if letter =~ /[0-9]/
      letter
    else
      @alpha.reverse[@alpha.index(letter)]
    end
  end
end
