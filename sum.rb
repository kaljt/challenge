require 'pry'

module Multipliable
  def find_factors(limit)
    factor_set = []
    self.number_set.each do |val|
      result = 0
      counter = 1
      while result < limit
      result = val * counter
      factor_set << result unless result >= limit
      counter += 1
      end
    end
    (self.number_set.concat(factor_set)).uniq
  end
end

class  SumOfMultiples
  include Multipliable
  
  attr_reader :number_set
  
  def initialize(*number_set)
    @number_set = number_set
  end
  
  def self.to(limit)
    factors = find_factors(limit)
    factors.reduce(:+)
  end
  
  def to(limit)
    
    factors = find_factors(limit)
    #binding.pry
    factors.reduce(:+)
  end
  
end