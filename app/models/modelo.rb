class Modelo < ActiveResource::Base  
  
  self.site = "https://assinatura-api.herokuapp.com/api/v1/" 
  
  #self.site = "tcp://localhost:3001/api/v1/" 

  self.element_name = "modelo"

  has_many :assinaturas
  belongs_to :marca
  
  schema = {'nome' => :string, 'marca_id' => :integer}

  self.include_format_in_path = false

  def self.of_marca(marca_id=0)
    return nil if marca_id == 0
    url = "https://assinatura-api.herokuapp.com/api/v1/marcas/"+marca_id.to_s+"/modelos"
    response = RestClient.get(url)
    json = JSON.parse(response.body)
  end

end

