class Scribble < ApplicationRecord
  belongs_to :note
  belongs_to :classroom



  # scope :sharable_note, ->{where(sharable: true)}

end
