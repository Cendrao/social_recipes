require 'rails_helper'

feature 'admin creates kitchens' do

  scenario 'user navigates to create kitchen' do
    visit root_path
    click_on 'Cadastrar Cozinha'
    expect(page).to have_css('form')

    within 'form' do
      expect(page).to have_content('Nome')
    end
  end

  scenario 'successfully' do
    kitchen = build(:kitchen)
    visit new_kitchen_path
    fill_in 'Nome', with: kitchen.name
    click_on 'Cadastrar'
    expect(page).to have_content(kitchen.name)
  end

  scenario 'should fail because name is mandatory' do
    visit new_kitchen_path
    click_on 'Cadastrar'
    expect(page).to have_content('Campos com (*) são obrigatórios')
  end
end
