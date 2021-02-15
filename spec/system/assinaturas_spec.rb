require 'rails_helper'

feature 'Visitante acessa a assinaturas de pitzi' do

  background(:all) do
    # Esses dados ficam na base de dados de testes do servico web (APIRest) 
    @assinatura  = Assinatura.first
    cliente = Cliente.first
    @modelo = Modelo.first
    @cpf_cliente = rand 1500000..2500000
      
  end

  scenario 'entra a pagina principal' do
    visit root_path
    expect(page).to have_content('Assinaturas')
  end

  scenario 'entra a pagina de assinaturas' do
    visit '/assinaturas'
    expect(page).to have_content('Lista de assinaturas')
  end

  scenario 'entra a pagina de inserir uma nova assinatura do cliente' do
    visit '/assinaturas'
    click_link('form-search-cliente')
    expect(page).to have_content('Verificando o CPF do Cliente')
  end

  scenario 'entra a pagina de inserir nova assinatura para um cliente que nao existe' do
    visit '/assinaturas'
    click_link('form-search-cliente')
    #within("#form-search") do
      fill_in "cpf_cliente", with: @cpf_cliente
      click_button 'commit'
    #end
    expect(page).to have_content('Nova assinatura')

  end

  scenario 'entra a pagina de inserir nova assinatura com dados incompletos do cliente' do
    visit '/assinaturas'
    click_link('form-search-cliente')
    fill_in "cpf_cliente", with: @cpf_cliente
    click_button 'commit'
    # Insirindo dados do cliente
    fill_in "nome", with: SecureRandom.alphanumeric

    click_button 'commit'
    expect(page).to have_content('Por favor, insira o cpf')

  end

  scenario 'entra a pagina de inserir nova assinatura sem dados da assinatura' do
    visit '/assinaturas'
    click_link('form-search-cliente')
    fill_in "cpf_cliente", with: @cpf_cliente
    click_button 'commit'
    # Insirindo dados do cliente
    fill_in "nome", with: SecureRandom.alphanumeric
    fill_in "cpf", with: @cpf_cliente
    fill_in "email", with: SecureRandom.alphanumeric+'@pitzi.com.br'

    click_button 'commit'
    expect(page).to have_content('Por favor, insira o IMEI do telefone')

  end


  scenario 'entra a pagina de inserir nova assinatura para um cliente e assinaturas válidos' do
    visit '/assinaturas'
    click_link('form-search-cliente')
    fill_in "cpf_cliente", with: @cpf_cliente
    click_button 'commit'

    # Insirindo dados do cliente
    fill_in "nome", with: SecureRandom.alphanumeric
    fill_in "cpf", with: @cpf_cliente
    fill_in "email", with: SecureRandom.alphanumeric+'@pitzi.com.br'

    # Insirindo dados da assinatura
    select('Apple', from: 'select-marca')
    select('iPhone6', from: 'select-marca')
    fill_in "assinatura_imei", with: '123456789012345'
    fill_in "assinatura_preco_anual", with: 250.90
    fill_in "assinatura_num_parcelas", with: 4
    fill_in "assinatura_data_emisao", with: Date.today
    fill_in "assinatura_data_vencimento", with: Date.today+365

    click_button 'commit'

    expect(page).to have_content('A assinatura foi criada com sucesso')

  end

end


