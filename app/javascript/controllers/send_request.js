import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["button"];

  connect() {
    this.buttonTarget.addEventListener("click", this.enviarSolicitud.bind(this));
  }

  enviarSolicitud() {
    console.log('Método enviarSolicitud ejecutado');

    const url = 'https://musicpro.bemtorres.win/api/v1/transporte/solicitud';
    const data = {
      nombre_origen: 'Mario Perez',
      direccion_origen: 'Av 1 de mayo # 1-1',
      nombre_destino: 'Marcela Torres',
      direccion_destino: 'Calle 1 # 1-1',
      comentario: 'Envio de documentos',
      info: ''
    };

    fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    })
      .then(response => response.json())
      .then(response => {
        console.log('Solicitud de transporte enviada:', response);
        if (response.id) {
          this.showSuccessMessage(response.id);
        } else {
          this.showErrorMessage();
        }
      })
      .catch(error => {
        console.error('Error al enviar la solicitud de transporte:', error);
        this.showErrorMessage();
      });
  }

  showSuccessMessage(id) {
    const container = document.getElementById('messages-container');
    container.innerHTML = `<p class="bg-green-500 text-white font-bold py-2 px-3 rounded mt-2">¡La solicitud de transporte se ha enviado correctamente! ID: ${id}</p>`;
  }

  showErrorMessage() {
    const container = document.getElementById('messages-container');
    container.innerHTML = '<p class="bg-red-500 text-white font-bold py-2 px-3 rounded mt-2">¡Ha ocurrido un error al enviar la solicitud de transporte!</p>';
  }
}
