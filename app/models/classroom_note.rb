class ClassroomNote < ApplicationRecord
  belongs_to :note
  belongs_to :classroom

  # accepts_nested_attributes_for :note
end
