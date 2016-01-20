require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("animal shelter pathways", {:type => :feature}) do
  it("visits shelter page") do
    visit "/"
    click_link "Shelter Page"
    expect(page).to have_content("Shelter Use Only!")
  end
  it("visits customer page") do
    visit "/"
    click_link "Adoption Page"
    expect(page).to have_content("Check out our animals!")
  end
  it("visits add_animal_form page") do
    visit "/shelter"
    click_link "Add an Animal"
    expect(page).to have_content("Enter Animal Info")
  end

  it("adds to a list of animals") do
    visit "/shelter/add_animal_form"
    fill_in "name",  with: "Charlie"
    fill_in "gender" , with: "female"
    fill_in "admittance_date", with: "2016-01-01 00:00:00"
    fill_in "type", with: "dog"
    fill_in "breed", with: "Great Dane"
    click_button("Enter")
    expect(page).to have_content("Success")
  end

  it("adds to a list of customers") do
    visit "/shelter/add_cust_form"
    fill_in "name",  with: "Frank"
    fill_in "phone" , with: 5034206969
    fill_in "animal_type_pref", with: "dog"
    fill_in "breed_preference", with: "dog"
    fill_in "breed", with: "Great Dane"
    click_button("Enter")
    expect(page).to have_content("Success")
  end
end
