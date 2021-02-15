class Pitzi 

  # Permite deserializar los objetos json obtidos mediante ActiveResource
  def self.deserializer_colection(json_active_resource)
    result = []
    json_active_resource.each do |jac|
        hash = jac.attributes['attributes'].attributes
        hash[:id] =  jac.id
        result << hash
    end
    return result
  end

  
  # Permite deserializar los objetos json obtidos mediante ActiveResource
  def self.deserializer_object(json_active_resource)
    hash = json_active_resource.attributes['attributes'].attributes
    hash[:id] =  json_active_resource.id
    return hash
  end

  

end