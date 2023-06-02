require 'net/http'
require 'json'

class EmailBemtorresService
  def initialize
    send_email_to_bemtorres
  end

  def send_email_to_bemtorres
    uri = URI("https://musicpro.bemtorres.win/docs/api-docs.json")
    response = Net::HTTP.get(uri)
    parsed_response = JSON.parse(response)
    saludo = parsed_response.dig("paths", "/api/v1/test/saludo", "get", "responses", "200", "content", "application/json", "schema", "properties", "message", "example")

    # Aquí puedes usar el saludo obtenido para enviar un correo electrónico a "bemtorres"

    saludo # Solo para mostrar el saludo en la consola, puedes eliminar esta línea después de probarlo
  end
end

EmailBemtorresService.new
