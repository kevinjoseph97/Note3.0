class Note < ApplicationRecord

    belongs_to :student 
    has_many :scribbles
    has_many :classrooms, through: :scribbles


    # accepts_nested_attributes_for :classrooms

    validates :title,  presence: true
    validates :content, presence: true
    validates :student_id, presence: true




    scope :ordered_by, -> { order('created_at DESC') }

    scope :shared, -> { joins(:scribbles).where('scribbles.sharable =?', true) }
end


