# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



5.times do 
    Student.create(username:Faker::Movies::HarryPotter.character,  password: 'hi')
end




3.times do 
    Classroom.create(subject: Faker::Educator.subject, student: Student.all.sample )
end


