class Assinatura < ActiveResource::Base  
  
  self.site = "https://assinatura-api.herokuapp.com/api/v1/" 

  #self.site = "tcp://localhost:3001/api/v1/" 

  self.element_name = "assinatura"

  belongs_to :modelo
  belongs_to :cliente
      
  schema = { 'imei' => :string, 'preco_anual' => :decimal, 'num_parcelas' => :integer,
           'status' => :integer, 'data_emisao' => :date, 'data_vencimento' => :date, 
           'modelo_id' => :integer, 'cliente_id' => :integer }

  self.include_format_in_path = false

  # Obtem as assinaturas para um cliente
  def self.cliente(cliente_id=0)
    return [] if cliente_id == 0
    url = "https://assinatura-api.herokuapp.com/api/v1/clientes/"+cliente_id.to_s+"/assinaturas"
    response = RestClient.get(url)
    json = JSON.parse(response.body)
  end

  def self.todas
    url = "https://assinatura-api.herokuapp.com/api/v1/assinaturas"
    response = RestClient.get(url)
    json = JSON.parse(response.body)
  end

end

