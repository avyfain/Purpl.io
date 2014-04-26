# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


terms = ['4540']

# subject_response = HTTParty.get('http://vazzak2.ci.northwestern.edu/subjects/').body
# subject_array = JSON.parse(subject_response)
# subjects = []



subjects = ["EECS" , "MATH" , "ECON"]

for t in terms 
	for s in subjects
		course_string = HTTParty.get('http://vazzak2.ci.northwestern.edu/courses/?term='+t+'&subject='+s).body
		course_array = JSON.parse(course_string)
		
		course_array.each do |c|
			Course.create!( title: c["title"], 
						subject: s, 
						term: c["term"], 
						catalog_number: c["catalog_num"] , 
						professor_name: c["instructor"]["name"]
						)
		end

	end
end