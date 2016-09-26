require 'rails_helper'

feature 'user creates a recipe' do

  scenario 'user navigates to create recipe' do
    visit root_path
    
    click_on 'Enviar Receita'
    
    expect(page).to have_css('form')

    within 'form' do
      expect(page).to have_content('Título')
      expect(page).to have_content('Cozinhas')
      expect(page).to have_content('Tipo de comida')
      expect(page).to have_content('Porções')
      expect(page).to have_content('Tempo de preparo (minutos)')
      expect(page).to have_content('Nível de Dificuldade')
      expect(page).to have_content('Ingredientes')
      expect(page).to have_content('Passo a passo')
   end
  end
  
  scenario 'successfully' do
    visit new_recipe_path
    recipe = create :recipe
    
    fill_in 'Título', with: recipe.title
    fill_in 'Cozinhas', with: recipe.kitchen
    fill_in 'Tipo de comida', with: recipe.food_type
    fill_in 'Porções', with: recipe.serving
    fill_in 'Tempo de preparo (minutos)', with: recipe.time
    fill_in 'Nível de Dificuldade', with: recipe.difficulty
    fill_in 'Ingredientes', with: recipe.ingredients
    fill_in 'Passo a passo', with: recipe.directions
    
    within 'form' do
      click_on 'Enviar Receita'
    end
    
    expect(page).to have_content(recipe.title)
    expect(page).to have_content(recipe.ingredients)
    expect(page).to have_content(recipe.directions)
  end
  
  scenario 'should fail because mandatory field were not filled' do
    visit new_recipe_path
    recipe = create :recipe
    
    fill_in 'Cozinhas', with: recipe.kitchen
    fill_in 'Tipo de comida', with: recipe.food_type
    fill_in 'Porções', with: recipe.serving
    fill_in 'Tempo de preparo (minutos)', with: recipe.time
    fill_in 'Nível de Dificuldade', with: recipe.difficulty
    fill_in 'Passo a passo', with: recipe.directions
    
    within 'form' do
      click_on 'Enviar Receita'
    end
    
    expect(page).to have_content('Campos com (*) são obrigatórios')
  end
end
