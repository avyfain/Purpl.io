class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :answer

  def time_thing
    t = (Answer.last.created_at)
  end

end