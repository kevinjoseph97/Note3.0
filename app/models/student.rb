class Student < ApplicationRecord
    has_secure_password


    validates :username, presence: true
    validates :username, uniqueness: true

    has_many :classrooms
    has_many :notes 


    def self.create_from_omniauth(auth)
        Student.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.password = SecureRandom.hex(16)
        end

    end

    
    
end
