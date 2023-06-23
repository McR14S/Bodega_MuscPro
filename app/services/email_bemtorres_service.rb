require 'net/http'
require 'json'

class EmailBemtorresService
  def initialize
    send_email_to_bemtorres
    send_transport_request
  end

  #get, error de nombre, es un get de saludo
  def send_email_to_bemtorres
    uri = URI("https://musicpro.bemtorres.win/docs/api-docs.json")
    response = Net::HTTP.get(uri)
    parsed_response = JSON.parse(response)
    saludo = parsed_response.dig("paths", "/api/v1/test/saludo", "get", "responses", "200", "content", "application/json", "schema", "properties", "message", "example")

    # Aquí puedes usar el saludo obtenido para enviar un correo electrónico a "bemtorres"

    saludo # Solo para mostrar el saludo en la consola, puedes eliminar esta línea después de probarlo
  end

  #Post de solicitud de transporte
  def send_transport_request
    uri = URI("https://musicpro.bemtorres.win/api/v1/transporte/solicitud")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == "https"

    request = Net::HTTP::Post.new(uri)
    request["Content-Type"] = "application/json"
    
    request.body = {
      nombre_origen: "Mario Perez",
      direccion_origen: "Av 1 de mayo # 1-1",
      nombre_destino: "Marcela Torres",
      direccion_destino: "Calle 1 # 1-1",
      comentario: "Envio de documentos",
      info: ""
    }.to_json

    response = http.request(request)

    if response.code.to_i == 201
      transport_info = JSON.parse(response.body)
      # Procesa la información de transporte recibida
      puts "Información de transporte recibida: #{transport_info}"
    else
      puts "Error al realizar la solicitud de transporte. Código de respuesta: #{response.code}"
    end
  end
  
end

EmailBemtorresService.new
