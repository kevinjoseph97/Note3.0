class ClassroomNote < ApplicationRecord
  belongs_to :note
  belongs_to :classroom
end
