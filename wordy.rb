class WordProblem
  OPERATIONS = { :+ => 'plus', :- => 'minus', :* => 'multiplied', :/ => 'divided' }.freeze

  def initialize(problem_string)
    @values = []
    problem_string.scan(/-?\d+/) { |match| @values << match.to_i }
    @operators = problem_string.scan(/#{OPERATIONS.values.join("|")}/)
    fail ArgumentError if @values.empty? || @operators.empty?
  end

  def answer
    @values.inject { |a, e| a.send(OPERATIONS.key(@operators.shift), e) }
  end
end
