class Classroom < ApplicationRecord
  belongs_to :student



  has_many :scribbles 
  has_many :notes, through: :scribbles



  # has_many :classroom_notes 
  # has_many :notes, through: :classroom_notes

  
end




