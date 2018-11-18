require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "Recipe creation" do

  after(:each) do
    Recipe.destroy_all
  end

  scenario "when a user creates a duplicate recipe" do
    recipe = Recipe.create(name: "My Recipe")
    visit "/recipes/new"
    fill_in "Name", with: recipe.name
    click_button "Create Recipe"
    expect(page).to have_content("Name has already been taken")
  end

  scenario "when a user creates a recipe without a name" do
     visit "/recipes/new"
     fill_in "Name", with: ""
     click_button "Create Recipe"
     expect(page).to have_content("Name can't be blank.")
  end

  scenario "when a user creates a recipe without ingredients" do
     visit "/recipes/new"
     fill_in "Name", with: ""
     click_button "Create Recipe"
     expect(page).to have_content("Ingredients can't be blank.")
  end

  scenario "when a user creates a recipe without instructions" do
     visit "/recipes/new"
     fill_in "Name", with: ""
     click_button "Create Recipe"
     expect(page).to have_content("Instructions can't be blank.")
  end

  scenario "when a non-logged in user tries to create a recipe" do
    visit "/recipes"
    click_button "Create New Recipe"
    expect(page).to have_content("Only logged-in users can create recipes.")
  end
end
