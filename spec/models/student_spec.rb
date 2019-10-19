require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "relationships" do
    it { should have_many :instructors }
    it { should have_many(:instructors).through(:student_instructors)}
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cohort }
    it { should validate_presence_of :age }
  end
end