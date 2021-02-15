class Cliente < ActiveResource::Base  
  
  self.site = "https://assinatura-api.herokuapp.com/api/v1/" 
  
  #self.site = "tcp://localhost:3001/api/v1/" 

  self.element_name = "cliente"

  has_many :assinaturas

  schema = { 'nome' => :string, 'cpf' => :string, 'email' => :string }

  self.include_format_in_path = false



end

