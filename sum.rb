require 'pry'

module Multipliable
  def find_factors(limit)
    factor_set = []
    return [0] if self.number_set.first > limit
    self.number_set.each do |val|
      break if val > limit
      result = 0
      counter = 1
      while result < limit
      result = val * counter
      factor_set << result unless result >= limit
      counter += 1
      end
    end
    #(self.number_set.concat(factor_set)).uniq
    factor_set.uniq
  end
end

class  SumOfMultiples
  include Multipliable
  
  attr_reader :number_set
  
  def initialize(*number_set)
    @number_set = number_set.sort
  end
  
  def self.to(limit)
    #self.extend Multipliable
    @sum_obj = SumOfMultiples.new(3,5)
    #binding.pry
    factors = @sum_obj.find_factors(limit)
    factors.reduce(:+)
  end
  
  
  def to(limit)
    
    factors = find_factors(limit)
    factors.reduce(:+)
  end
  
end