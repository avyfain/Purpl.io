class Question < ActiveRecord::Base

  has_many :answers
  belongs_to :student
  belongs_to :course

  def time_thing
    t = (self.answers.any? ? self.answers.last.created_at : self.created_at)
  end

  def read? user
  	self.readmap.split("|").include?(user.id.to_s)
  end

end