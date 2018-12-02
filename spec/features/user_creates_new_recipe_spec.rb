require 'capybara/rspec'
require 'rails_helper'

RSpec.feature "User creates a recipe" do
  before(:all) do
    user = create(:user, username: "test", email: "test@test.com", password: "test123)")
    visit(login_path)
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'test123')
    puts page.body
    click_button "Log In"
    page.should have_content("Log Out")
  end

  after(:each) do
    Recipe.destroy_all
  end

  scenario "when a user creates a duplicate recipe" do
    recipe = Recipe.create(name: "My recipe")
    visit "/recipes/new"
    puts page.body
    fill_in "Recipe name", with: recipe.name
    click_on "Create Recipe"
    expect(page).to have_content("Name has already been taken")
  end

  scenario "when a user creates a recipe without a name" do
     visit "/recipes/new"
     fill_in "Recipe name", with: ""
     click_on "Create Recipe"
     expect(page).to have_content("Name can't be blank.")
  end

  scenario "when a user creates a recipe without ingredients" do
     visit "/recipes/new"
     fill_in "Name", with: ""
     click_on "Create Recipe"
     expect(page).to have_content("Ingredients can't be blank.")
  end

  scenario "when a user creates a recipe without instructions" do
     visit "/recipes/new"
     fill_in "Name", with: ""
     click_on "Create Recipe"
     expect(page).to have_content("Instructions can't be blank.")
  end

  scenario "when a non-logged in user tries to create a recipe" do
    visit "/recipes"
    click_on "Create New Recipe"
    expect(page).to have_content("Only logged-in users can create recipes.")
  end
end
