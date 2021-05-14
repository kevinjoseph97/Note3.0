class Classroom < ApplicationRecord
  belongs_to :student

  has_many :classroom_notes 
  has_many :notes, through: :classroom_notes
end




