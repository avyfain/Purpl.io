class Question < ActiveRecord::Base

  has_many :answers
  belongs_to :student
  belongs_to :course

end