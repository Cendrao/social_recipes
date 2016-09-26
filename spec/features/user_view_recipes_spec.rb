require 'rails_helper'

feature 'user view all recipes' do
  scenario 'successfully' do
    recipe = create(:recipe) 
    another_recipe = create(:recipe)
    third_recipe = create(:recipe)
    
    visit root_path
    
    click_on 'Ver Receitas'
    expect(page).to have_content(recipe.title)
    expect(page).to have_content(another_recipe.title)
    expect(page).to have_content(third_recipe.title)
  end
end