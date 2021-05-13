# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Student.create(username: "Test1", major: 'Bio', password_digest:"hi" )
Student.create(username: "Test2", major: 'Math', password_digest:"hii" )
Student.create(username: "Test3", major: 'Science', password_digest:"hiii" )
Student.create(username: "Test4", major: 'Art', password_digest:"hiiii" )


Classroom.create(subject: 'Bio', student_id: '1')
Classroom.create(subject: 'Math', student_id: '2')
Classroom.create(subject: 'Science', student_id: '3')
Classroom.create(subject: 'Art', student_id: '4')

