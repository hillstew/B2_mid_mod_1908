require 'rails_helper'

RSpec.describe "Students index page" do 
  describe "As a user" do
    describe "When I visit /students" do
      it "displays all students" do
        hill = Student.create(name: "Hillary", cohort: 1908, age: 28)
        kylie = Student.create(name: "Kylie", cohort: 1808, age: 28)
        meg = hill.instructors.create(name: "Meg")
        mike = hill.instructors.create(name: "Mike")
        brittany = kylie.instructors.create(name: "Brittany")
        pam = kylie.instructors.create(name: "Pam")

        visit '/students'

        within "#student-#{hill.id}" do
          expect(page).to have_content(hill.name)
          expect(page).to have_content(hill.cohort)
          expect(page).to have_content(hill.age)
        end
       
        within "#student-#{hill.id}-instructors" do
          expect(page).to have_content(meg.name)
          expect(page).to have_content(mike.name)
        end

        within "#student-#{kylie.id}" do
          expect(page).to have_content(kylie.name)
          expect(page).to have_content(kylie.cohort)
          expect(page).to have_content(kylie.age)
        end

        within "#student-#{kylie.id}-instructors" do
          expect(page).to have_content(brittany.name)
          expect(page).to have_content(pam.name)
        end
      end
    end
  end
end