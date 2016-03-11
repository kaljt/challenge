class Trinary
  BASE = 3
  
  def initialize(trinary_string)
      @trinary_string = trinary_string
  end
  
  def valid?
    test_pattern = /^[0-2]*$/
    @trinary_string.match(test_pattern).to_s.eql?(@trinary_string)
  end
  
  def to_decimal
    decimal_value = 0
    if valid?
      @trinary_string.reverse.split('').each_with_index do |digit, power|
      decimal_value += (digit.to_i * BASE**power)
      end
    end
    decimal_value
  end

end