class CreateStudentInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :student_instructors do |t|
      t.references :student, foreign_key: true
      t.references :instructor, foreign_key: true
    end
  end
end
