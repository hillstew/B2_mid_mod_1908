require 'rails_helper'

RSpec.describe "Instructor Show page" do
  describe "When I visit the Students Index page" do
    describe "I click a link (instructors name)" do
      it "I am taken to a new page with that instructors name, students, and age" do
        meg = Instructor.create(name: "Meg")
        mike = Instructor.create(name: "Meg")
        hill = meg.students.create(name: "Hillary", cohort: 1908, age: 28)
        kylie = meg.students.create(name: "Kylie", cohort: 1908, age: 28)
        libby = meg.students.create(name: "Libby", cohort: 1908, age: 35)
        jack = meg.students.create(name: "Jack", cohort: 1908, age: 41)
        sally = mike.students.create(name: "Sally", cohort: 1908, age: 41)
        drake = mike.students.create(name: "Drake", cohort: 1908, age: 21)

        visit '/students'

        within "#student-#{hill.id}-instructors" do
          click_link "#{meg.name}"
        end

        expect(current_path).to eq("/instructors/#{meg.id}")

        expect(page).to have_content(meg.name)

        within "#students-#{meg.id}" do
          expect(page).to have_content(hill.name)
          expect(page).to have_content(kylie.name)
          expect(page).to have_content(libby.name)
          expect(page).to have_content(jack.name)
          expect(page).to_not have_content(sally.name)
          expect(page).to_not have_content(drake.name)
        end

        expect(page).to have_content(meg.student_avg_age)
      end
    end
  end
end