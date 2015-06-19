# Gallery

Sencilla galeria de imagenes hecha en Rails para la pagina
[ArtesaniaSory.com.ve](http://artesaniasory.com.ve)


## Instalacion:

* Descargar las dependencias con: `bundle install`.

* En `/config/database.yml` agregar los datos de conexion a la BD PostgreSQL.

* En la raiz de la app crear un archivo `.env` y rellenar con lo siguiente:


    RAILS_ENV=production
    RACK_ENV=production
    PORT=3000
    DEVISE_SECRET_KEY=0000000111111222222etc
    SECRET_KEY_BASE=000001111122222etc


* Crear las BD con el comando: `rake db:create RAILS_ENV=production`.

* Correr las migraciones de las tablas con el comando: `rake db:migrate RAILS_ENV=production`

* Precompilar los assets con el comando: `foreman run -e .env rake assets:precompile`

* Luego de instalar, ejecuta en una terminal: `foreman start`.



**Procfile** de ejemplo para entorno de produccion y trabajar con nginx:

`web: bundle exec puma -t 5:5 -e production -b unix:///tmp/galeria.sock --pidfile /tmp/puma.pid`

**Procfile** de ejemplo para entorno de desarrollo:
`web: bundle exec rails s -e $RAILS_ENV -p $PORT`
