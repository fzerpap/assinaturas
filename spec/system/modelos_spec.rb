require 'rails_helper'

feature 'Visitante acessa a modelos de telefones' do

  background(:all) do
    # Esses dados ficam na base de dados de testes do servico web (APIRest) 
    @marca  = Marca.first
    @modelo  = Modelo.first
  end

  scenario 'entra a pagina principal' do
    visit root_path
    expect(page).to have_content('Assinaturas')
  end

  scenario 'entra a pagina de modelos de telefone' do
    visit '/modelos'
    expect(page).to have_content('Lista de modelos de Telefone')
  end

  scenario 'entra a pagina de inserir uma nova modelo de telefone' do
    visit '/modelos/new'
    expect(page).to have_content('Nome do modelo')
  end

  scenario 'insirendo um novo modelo de telefone' do
    visit '/modelos/new'
    within("#form-modelo") do
      select('Apple', from: 'modelo_marca_id')
      fill_in "modelo_nome", with: SecureRandom.alphanumeric
      click_button 'commit'
    end
    expect(page).to have_content('O modelo foi criado com sucesso')

  end
  scenario 'insirendo um novo modelo de telefone que já existe' do
    visit '/modelos/new'
    within("#form-modelo") do
      select('Apple', from: 'modelo_marca_id')
      fill_in "modelo_nome", with: @modelo.nome
      click_button 'commit'
    end
    expect(page).to have_content('Nome has already been taken')
  end



end


