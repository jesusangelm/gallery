# Gallery

Sencilla galeria de imagenes hecha en Rails para la pagina
[ArtesaniaSory.com.ve](http://artesaniasory.com.ve)


## Instalacion:

* Descargar las dependencias con: `bundle install`.

* En `/config/database.yml` agregar los datos de conexion a la BD PostgreSQL.

* En la raiz de la app crear un archivo `.env` y rellenar con lo siguiente:


    RACK_ENV=production
    PORT=3000
    SECRET_KEY_BASE="000001111122222"


* En `config/initializers/devise.rb` colocar la **secret key** pasa devise en `config.secret_key`.

* Crear las BD con el comando: `rake db:create RAILS_ENV=production`.

* Correr las migraciones de las tablas con el comando: `rake db:migrate RAILS_ENV=production`

* Precompilar los assets con el comando: `rake assets:precompile RAILS_ENV=production`

* Luego de instalar, ejecuta en una terminal: `foreman start`.
