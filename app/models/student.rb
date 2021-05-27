class Student < ApplicationRecord
    has_secure_password

    has_many :classrooms
    has_many :notes 


    validates :username, presence: true 

    
end
