class Student < ApplicationRecord
  validates_presence_of :name, :cohort, :age

  has_many :student_instructors
  has_many :instructors, through: :student_instructors
end