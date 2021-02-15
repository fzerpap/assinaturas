require 'rails_helper'

feature 'Visitante acessa a marcas de telefones' do

  background(:all) do
    # Esses dados ficam na base de dados de testes do servico web (APIRest) 
    @marca  = Marca.first
  
  end
  scenario 'entra a pagina principal' do
    visit root_path
    expect(page).to have_content('Assinaturas')
  end

  scenario 'entra a pagina de marcas de telefone' do
    visit '/marcas'
    #visit marcas_path
    expect(page).to have_content('Lista de marcas de Telefone')
  end

  scenario 'entra a pagina de inserir uma nova marca de telefone' do
    visit '/marcas/new'
    expect(page).to have_content('Nome da marca')
  end

  scenario 'insirendo uma nova marca de telefone' do
    visit '/marcas/new'
    within("#form-marca") do
      fill_in "marca_nome", with: SecureRandom.alphanumeric
      click_button 'commit'
    end
    expect(page).to have_content('A marca foi criada com sucesso')

  end
  scenario 'insirendo uma nova marca de telefone que já existe' do
    visit '/marcas/new'
    within("#form-marca") do
      fill_in "marca_nome", with: @marca.nome
      click_button 'commit'
    end
    expect(page).to have_content('Nome has already been taken')
  end

  scenario 'editando um marca de telefone' do
    visit '/marcas/'+@marca.id.to_s+'/edit'
    within("#form-marca") do
      fill_in "marca_nome", with: @marca.nome
      click_button 'commit'
    end
    expect(page).to have_content('Lista de marcas de Telefone')
  end



end