class Course < ActiveRecord::Base

  has_many :questions
  belongs_to :professor

end