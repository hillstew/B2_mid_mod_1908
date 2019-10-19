require 'rails_helper';

RSpec.describe Instructor, type: :model do
  describe "relationships" do
    it { should have_many :students }
    it { should have_many(:students).through(:student_instructors)}
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end
end