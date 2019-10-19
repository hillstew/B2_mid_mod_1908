require 'rails_helper'

RSpec.describe StudentInstructor, type: :model do
  describe "relationships" do
    it { should belong_to :student }
    it { should belong_to :instructor }
  end
end
