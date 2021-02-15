require 'rest-client'

class Marca < ActiveResource::Base  
  
  self.site = "https://assinatura-api.herokuapp.com/api/v1/" 

  #self.site = "tcp://localhost:3001/api/v1/" 

  self.element_name = "marca"
  has_many :modelos
  
  schema = {'nome' => :string }

  self.include_format_in_path = false

  
end

