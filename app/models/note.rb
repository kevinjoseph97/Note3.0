class Note < ApplicationRecord

    belongs_to :student 
    has_many :scribbles
    has_many :classrooms, through: :scribbles




    accepts_nested_attributes_for :classrooms



    validates :title, :content,  presence: true

    scope :ordered_by, -> { order('created_at DESC') }
end
