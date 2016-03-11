require 'pry'
class Palindromes
  
  def initialize(max_factor: 1, min_factor: 1)
    @factor_range = (min_factor..max_factor).to_a
    @factor_range = (@factor_range.product(@factor_range)).map(&:sort).uniq
    @product_list = []
    @palindrome_list = []
  end
  
  def generate
    
    @factor_range.each do |num_pair|
    product = num_pair.reduce(:*)
    if product.to_s == product.to_s.reverse
      @product_list << product
      @palindrome_list << num_pair
    end
    end
  
  end
  
  def smallest
    PalindromeCalculator.new(@product_list.sort.first, @palindrome_list)
  end
  
  def largest
    PalindromeCalculator.new(@product_list.sort.last, @palindrome_list)
  end
end

class PalindromeCalculator
  attr_reader :value
  def initialize(value, pairs)
    @value = value
    @pairs = pairs
  end
  
  def factors
    @pairs.select { |values| (values.reduce(:*) == @value) }.map(&:sort).uniq
    #factor_list.map(&:sort).uniq
  end
end