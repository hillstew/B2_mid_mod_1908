require 'rails_helper';

RSpec.describe Instructor, type: :model do
  describe "relationships" do
    it { should have_many :students }
    it { should have_many(:students).through(:student_instructors)}
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "methods" do
    it "should return the average age of its students" do
      mike = Instructor.create(name: "Mike")
      mike.students.create(name: "Hillary", cohort: 1908, age: 30)
      mike.students.create(name: "Mary", cohort: 1908, age: 20)
      
      expect(mike.student_avg_age).to eq(25)
    end
  end
end