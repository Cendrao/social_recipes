require 'rails_helper'

feature 'user creates a recipe' do

  scenario 'user navigates to create recipe' do
    visit root_path
    click_on 'Enviar Receita'
    expect(page).to have_css('form')

    within 'form'do
    expect(page).to have_context('Título')
      expect(page).to have_context('Cozinhas')
      expect(page).to have_context('Tipo de comida')
      expect(page).to have_context('Porções')
      expect(page).to have_context('Tempo de preparo (minutos)')
      expect(page).to have_context('Nível de Dificuldade')
      expect(page).to have_context('Ingredientes')
      expect(page).to have_context('Passo a passo')

    end
  end

end
