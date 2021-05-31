class Classroom < ApplicationRecord
  belongs_to :student



  has_many :scribbles 
  has_many :notes, through: :scribbles

  validates :subject, presence: true 
  
end




