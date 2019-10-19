class Instructor < ApplicationRecord
  validates_presence_of :name

  has_many :student_instructors
  has_many :students, through: :student_instructors

  def student_avg_age
    students.average(:age)
  end
end