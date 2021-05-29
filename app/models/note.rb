class Note < ApplicationRecord

    belongs_to :student 
    has_many :scribbles
    has_many :classrooms, through: :scribbles


    accepts_nested_attributes_for :classrooms

    validates :title, :content, :student_id,  presence: true

    scope :ordered_by, -> { order('created_at DESC') }


 # I want to search through scrible table for note (id) that has sharable as true and show on note page
    scope :shared, -> { joins(:scribbles).where('scribbles.sharable =?', true) }
end
