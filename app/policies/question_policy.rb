class QuestionPolicy
  attr_reader :current_user, :model

  def initialize(user, question)
    @user = user
    @question = question
  end
end
