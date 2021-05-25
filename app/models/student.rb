class Student < ApplicationRecord
    has_secure_password

    has_many :classrooms
    has_many :notes 


    validates :username, presence: true 
    # validates :password, length: { in: 6..8 }


    # def self.create_from_omniauth(auth)
    #     Student.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
    #         u.username = auth['info']['first_name']
    #         u.password = SecureRandom.hex
    #     end

    # end

    
end
