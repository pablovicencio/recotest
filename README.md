<h1>RecoTest</h1>

<p>Recotest es una aplicación web que permite registrar usuarios, crear alertas y visualizar datos consumidos desde API de recorrido.cl.</p>
<p>Las alertas configuradas consultan la informacion de viajes disponibles para los proximos 7 días. Esta informacion se actualiza cada 5 minutos a traves de solicitudes AJAX en el cliente y Typhoeus desde el lado del servidor.</p>


<h2>Requisitos 📋</h2>

* Ruby versión 3.0.2

* Rails versión 6.0.4.1

* Git

<h2>Instalación 🔧</h2>

##### 1. Clona el repositorio

```
git clone https://github.com/pablovicencio/recotest.git
```
##### 2. Instala las Gemas 💎

```
bundle install
```

##### 3. Inicie el servidor Rails

```
rails server
```

Y ahora puede visitar el sitio con la URL http://localhost:3000




