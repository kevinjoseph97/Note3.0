class Note < ApplicationRecord

    belongs_to :student 
    has_many :classrooms_notes 
    has_many :classrooms, through: :classrooms_notes
end
