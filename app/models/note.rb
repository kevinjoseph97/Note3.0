class Note < ApplicationRecord

    belongs_to :student 
    has_many :classroom_notes 
    has_many :classrooms, through: :classroom_notes

    accepts_nested_attributes_for :classrooms
end
