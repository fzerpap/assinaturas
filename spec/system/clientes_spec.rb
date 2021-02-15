require 'rails_helper'

feature 'Visitante acessa a clientes de pitzi' do

  background(:all) do
    # Esses dados ficam na base de dados de testes do servico web (APIRest) 
    @cliente  = Cliente.first
    @cpf_cliente = rand 1500000..2500000
  
  end

  scenario 'entra a pagina principal' do
    visit root_path
    expect(page).to have_content('Assinaturas')
  end

  scenario 'entra a pagina de clientes' do
    visit '/clientes'
    expect(page).to have_content('Lista de clientes')
  end

  scenario 'entra a pagina de inserir um novo cliente de pitzi' do
    visit '/clientes/new'
    expect(page).to have_content('Nome do cliente')
  end

  scenario 'insirendo um novo cliente de pitzi' do
    visit '/clientes/new'
    within("#form-cliente") do
      fill_in "cliente_nome", with: SecureRandom.alphanumeric
      fill_in "cliente_cpf", with: @cpf_cliente
      fill_in "cliente_email", with: SecureRandom.alphanumeric+'@pitzi.com.br'
      click_button 'commit'
    end
    expect(page).to have_content('O cliente foi criado com sucesso')

  end
  scenario 'insirendo um novo cliente de pitzi que já existe' do
    visit '/clientes/new'
    within("#form-cliente") do
      fill_in "cliente_nome", with: SecureRandom.alphanumeric
      fill_in "cliente_cpf", with: @cliente.cpf
      fill_in "cliente_email", with: SecureRandom.alphanumeric+'@pitzi.com.br'
      click_button 'commit'
    end
    expect(page).to have_content('Cpf has already been taken')
  end

  scenario 'editando um cliente de pitzi' do
    visit '/clientes/'+@cliente.id.to_s+'/edit'
    within("#form-cliente") do
      fill_in "cliente_nome", with: SecureRandom.alphanumeric
      fill_in "cliente_cpf", with: @cliente.cpf
      fill_in "cliente_email", with: @cliente.email
      click_button 'commit'
    end
    expect(page).to have_content('O cliente foi atualizado com sucesso')
  end



end


