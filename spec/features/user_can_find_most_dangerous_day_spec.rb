# As a guest user
# When I visit "/"
# And I enter "2018-01-01" into the start date
# And I enter "2018-01-07" into the end date
# And I click "Determine Most Dangerous Day"
#
# Then I should be on "/most_dangerous_day"
# And I should see a heading for "Most Dangerous Day"
# And I should see "January 1, 2018 - January 7, 2018"
# And I should see a heading for the most dangerous day in that range "January 1, 2018"
# And I should see 3 asteroids in that list
#
# And I should see "Name: (2014 KT76)"
# And I should see "NEO Reference ID: 3672906"
#
# And I should see "Name: (2001 LD)"
# And I should see "NEO Reference ID: 3078262"
#
# And I should see "Name: (2017 YR1)"
# And I should see "NEO Reference ID: 3794979"

require 'rails_helper'

RSpec.describe 'Most Dangerous Day ', type: :feature do
  describe 'As a guest user' do
    describe 'When I visit /' do
      describe "And I enter '2018-01-01' into the start date" do
        describe 'And I enter 2018-01-07 into the end date' do
          describe 'And I click "Determine Most Dangerous Day" ' do

            before :each do
              visit rooth_path
              fill_in 'start_date', with: '2018-01-01'
              fill_in 'end_date', with: '2018-01-07'
              click_on 'Determine Most Dangerous Day'
            end

            it "my current path should be /most_dangerous_day" do
              expect(current_path).to eq('/most_dangerous_day')

            end

            it "should have a heading for 'Most Dangerous Day' " do
              expect(page).to have_content('Most Dangerous Day')
            end

            it "I should see 'January 1, 2018 - January 7, 2018' " do
              expect(page).to have_content('January 1, 2018 - January 7, 2018')


            end

            it "And I should see a heading for the most dangerous day in that range 'January 1, 2018' " do
              expect(page).to have_content("Most Dangerous Day: January 1, 2018")

            end

            it " I should see 3 asteroids in that list" do
              asteroids = page.all('.asteroids')

              expect(asteroids.count).to eq(3)

              within '.asteroids' do
                expect(page).to have_content("Name: (2014 KT76)")
                expect(page).to have_content("NEO Reference ID: 3672906")
              end

              # And I should see "Name: (2014 KT76)"
              # And I should see "NEO Reference ID: 3672906"
              #
              # And I should see "Name: (2001 LD)"
              # And I should see "NEO Reference ID: 3078262"
              #
              # And I should see "Name: (2017 YR1)"
              # And I should see "NEO Reference ID: 3794979"

            end


 

          end
        end
      end

    end
  end
end
