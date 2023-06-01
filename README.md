# README

# Requistos

 ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x64-mingw-ucrt] (Windows con instalador)
 Rails 7.0.4.3 (gem install rails)
 PostgreSQL 15.3 (Omitir buildkit)

# Pasos:
1 - git clone https://github.com/McR14S/Bodega_MuscPro.git
2 - Navegar hasta el directorio del repositorio (cd/"name")
3 - Modificar config/database.yml por tus datos (esta todo por defecto en postgres, solo cambiar contraseña)
4 - bundle install
5 - rails db:create
6 - rails db:migrate
7 - rails db:fixtures:load


# Iniciar servidor / en el caso de probar las css in live usar tambien la segunda sentencia de windows
 linux = bin/dev
 windows = rails server
         = rails tailwindcss:watch