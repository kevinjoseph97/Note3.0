class CreateClassroomNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :classroom_notes do |t|
      t.belongs_to :note, foreign_key: true
      t.belongs_to :classroom, null: false, foreign_key: true
      t.boolean :sharable

      t.timestamps
    end
  end
end
