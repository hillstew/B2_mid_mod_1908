class StudentInstructor < ApplicationRecord 
  belongs_to :student
  belongs_to :instructor
end