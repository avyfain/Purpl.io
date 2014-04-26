# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do 
	Student.create!(
	email: Faker::Internet.email,
	first_name: Faker::Name.first_name,
	password: "123",
	password_confirmation: "123",
	)
end

s = Student.find(1)

terms = ['4540']

# subject_response = HTTParty.get('http://vazzak2.ci.northwestern.edu/subjects/').body
# subject_array = JSON.parse(subject_response)
# subjects = []

subjects = ["EECS" , "MATH" , "ECON", "STAT"]

for t in terms 
	for sub in subjects
		course_string = HTTParty.get('http://vazzak2.ci.northwestern.edu/courses/?term='+t+'&subject='+sub).body
		course_array = JSON.parse(course_string)
		
		course_array.each do |c|
			Course.create!( title: c["title"], 
						subject: sub, 
						term: c["term"], 
						catalog_number: c["catalog_num"] , 
						professor_name: c["instructor"]["name"],
						last_locked_on: Time.now - 10000
						)
		end
		s.courses << Course.all.sample
	end
end
s.save

p = Professor.create!(
	email: Faker::Internet.email,
	name: Faker::Name.first_name,
	password: "123",
	password_confirmation: "123",
	)

p.courses = Course.where(subject: 'ECON').sample(3)
p.save


a = ["Help with ", "I can't figure out ", "Has anyone started ", "What's up with "]
b = ["the problem set ", "the hw ", "the lab ", "the paper "]
c = ["that's due tomorrow", "we got yesterday", "the professor explained in class", "I'm scared of this midterm"]

3.times do
	s.courses.each do |course|
		sentence = a.sample+b.sample+c.sample
		Question.create!(
			text: sentence,
			student_id: Student.all.sample.id,
			course_id: course.id,
			readmap: ""
			)
	end
end

a = ["Help with ", "I can't figure out ", "Has anyone started ", "What's up with "]
b = ["the problem set ", "the hw ", "the lab ", "the paper "]
c = ["that's due tomorrow", "we got yesterday", "the professor explained in class", "I'm scared of this midterm"]

(0..4).to_a.sample.times do
	s.courses.each do |course|
		sentence = a.sample+b.sample+c.sample
		Question.create!(
			text: sentence,
			student_id: Student.all.sample.id,
			course_id: course.id,
			readmap: ""
			)
	end
end

a = ["Help with ", "I can't figure out ", "Has anyone started ", "What's up with "]
b = ["the problem set ", "the hw ", "the lab ", "the paper "]
c = ["that's due tomorrow", "we got yesterday", "the professor explained in class", "I'm scared of this midterm"]

Question.all.each do |q|
	(0..4).to_a.sample.times do
		sentence = a.sample+b.sample+c.sample
		Answer.create!(
			text: sentence,
			student_id: Student.all.sample.id,
			)
		q.readmap = "#{Answer.last.student_id.to_s}|"	
		q.save
	end
end

30.times do
	Upvote.create!(question_id: Question.all.sample.id, student_id: Student.all.sample.id)
end
