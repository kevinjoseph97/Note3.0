class Student < ApplicationRecord
    has_secure_password

    has_many :classrooms
    has_many :notes 

    
    
end
