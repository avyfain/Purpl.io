class Question < ActiveRecord::Base

  has_many :answers
  belongs_to :student
  belongs_to :course
  has_many :upvotes

  def time_thing
    t = (Question.last.answers.any? ? Question.last.answers.last.created_at : Question.last.created_at)
  end

  def read? user
  	self.readmap.split("|").include?(user.id.to_s)
  end

end