
class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :respondent_has_not_already_answered_question
  validate :author_cannot_respond_to_question

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: "AnswerChoice"

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  def sibling_responses
    self.question.responses.where.not(id: id)
  end

  def respondent_has_not_already_answered_question
    if sibling_responses.any? { |response| response.user_id == user_id }
      errors[:user_id] << 'user has already responded to question'
    end
  end

  def author_cannot_respond_to_question
    if poll.author_id == user_id
      errors[:user_id] << 'Author cannot respons to own pull'
    end
  end
end
