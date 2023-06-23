# README

# Requistos

- ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x64-mingw-ucrt] (Windows con instalador)
- Rails 7.0.4.3 (gem install rails)
- PostgreSQL 15.3 (Omitir buildkit)

# Pasos:
- git clone https://github.com/McR14S/Bodega_MuscPro.git
- Navegar hasta el directorio del repositorio (cd/"name")
- Modificar config/database.yml por tus datos (esta todo por defecto en postgres, solo cambiar contraseña)
- bundle install
- rails db:create
- rails db:migrate
- rails db:fixtures:load


# Iniciar servidor / en el caso de probar las css in live usar tambien la segunda sentencia de windows
- linux = bin/dev
- windows = rails server
-         = rails tailwindcss:watch


# Soluciones:
- bundle add tailwindcss-rails
- rails db:reset
- delete tmp/cache




# Produccion!
- https://musicpro.fly.dev/

- fly auth signup
- fly launch

- git clone ""
- fly.git
- cd hello
- fly launch --now
- fly deploy
- fly open


# Comandos API!
URL base de la API: https://musicpro.fly.dev/

Endpoint para ver los productos:

Ruta: /
Método: GET
Parámetros de consulta opcionales:
category_id: ID de la categoría para filtrar los productos por categoría.
max_price: Precio máximo para filtrar los productos por rango de precio máximo.
min_price: Precio mínimo para filtrar los productos por rango de precio mínimo.
order_by: Ordenar los productos por precio (valores posibles: expensive para precios más altos primero, cheapest para precios más bajos primero).
query_text: Texto de búsqueda para buscar productos por título o descripción.
Para utilizar la API, los usuarios pueden hacer solicitudes HTTP GET a la URL base https://musicpro.fly.dev/ con los parámetros de consulta opcionales según sus necesidades. Aquí tienes un ejemplo de cómo se vería la URL completa para diferentes casos:

Obtener todos los productos:

URL: https://musicpro.fly.dev/
Método: GET
Filtrar productos por categoría:

URL: https://musicpro.fly.dev/?category_id=<ID_CATEGORÍA>
Método: GET
(Reemplaza <ID_CATEGORÍA> con el ID numérico de la categoría deseada)
Filtrar productos por rango de precio:

URL: https://musicpro.fly.dev/?min_price=<PRECIO_MÍNIMO>&max_price=<PRECIO_MÁXIMO>
Método: GET
(Reemplaza <PRECIO_MÍNIMO> y <PRECIO_MÁXIMO> con los valores numéricos correspondientes)
Ordenar productos por precio:

URL: https://musicpro.fly.dev/?order_by=<ORDEN>
Método: GET
(Reemplaza <ORDEN> con expensive para ordenar por precios más altos primero o cheapest para ordenar por precios más bajos primero)
Buscar productos por texto:

URL: https://musicpro.fly.dev/?query_text=<TEXTO>
Método: GET
(Reemplaza <TEXTO> con el texto de búsqueda deseado)
