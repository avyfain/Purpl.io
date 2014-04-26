class Professor < ActiveRecord::Base

  has_many :courses
  has_many :answers
  has_many :questions

  has_secure_password

end