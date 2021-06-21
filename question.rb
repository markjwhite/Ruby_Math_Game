class Question
  def initialize
    @num1 = rand(1..10)
    @num2 = rand(1..10)
    @answer = @num1 + @num2
  end

  def new_question
    "#{@num1} + #{@num2}"
  end

  def check_answer(answer)
    @answer == answer
  end
end
