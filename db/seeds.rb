# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do 

    Student.create(username: Faker::Name.first_name, major:Faker::Educator.degree, password: 'hi')
end


10.times do 
    Note.create(title:Faker::Games::Pokemon.name, content: Faker::Games::Pokemon.move, student: Student.all.sample )

end


5.times do 
    Classroom.create(subject: Faker::Educator.subject, student: Student.all.sample )

end


10.times do 
    ClassroomNote.create(note: Note.all.sample, classroom: Classroom.all.sample, sharable: true)
end
