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
          = rails tailwindcss:watch


# Soluciones:
- bundle add tailwindcss-rails
- rails db:reset
- telete tmp/cache




# Produccion!
https://musicpro.fly.dev/

- fly auth signup
- fly launch

-git clone ""
-fly.git
-cd hello
-fly launch --now
-fly deploy
-fly open