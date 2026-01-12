¡Por fin llegamos a Rails!

## Primera semana - Rails 101

Esta es la última "semana real" en Kitt con ejercicios diarios. A partir de la semana que viene empezaremos a trabajar con proyectos más largos, ya sea un asistente de IA o tu proyecto personal. Por ahora vamos a explorar la arquitectura de una App Rails fresca para entender lo que pasa dentro de la misma. **Vamos a crear una app Rails diariamente**.

### `01 Routing, Controllers & Views`

En el primer día verás el flujo estándar de Rails `ruta > controlador > vista` sin agregar el nivel del modelo ni la explicación de los `params`. Durante el transcurso del día transformarás ejercicios viejos de Ruby que hiciste en la semana 1 en apps en Rails.

### `02 Models & CRUD`

¡Aquí entra nuevamente nuestro viejo amigo Active Record! **Una de las clases (lectures) de Rails más importantes del bootcamp** Tu profesor/a principal va a escribir todo el código de las 7 acciones CRUD desde cero y a introducir la herramienta de ruteo `resources`. ¡Presta mucha atención! 🤓

### `03 Advanced Routing`

Hoy agregaremos un segundo modelo de aplicación Rails creando un clon de dos modelos de Yelp con restaurantes y reviews. La clase matinal es sobre **ir más allá de CRUD** con ruteo avanzado y validaciones en Rails.

### `04 Rails Assets`

Aprenderás la mejor forma de implementar Bootstrap SCSS + bibliotecas front-end, y a pasar de `form_with` a `simple_form_for` usando la configuración de Simple Form de Bootstrap.

Aprenderás sobre el asset pipeline.

Para los ejercicios, empezarás un proyecto de dos días para construir una app de Watch List, con 3 modelos: `Movie`, `Bookmark` y `List`.
Deberás seguir cuidadosamente la configuración frontend para trabajar en una app que luzca bien.

### `05 Hosting & Image Upload`

La clase (lecture) de esta mañana tiene 2 partes:
**Hosting**: El deployment en [Heroku](http://heroku.com/)

**Carga de Imágenes**: Vamos a alojar las imágenes en [Cloudinary](http://cloudinary.com/), usando [ActiveStorage](https://guides.rubyonrails.org/v6.0.1/active_storage_overview.html). El curso también incluye como asegurar tus API keys usando la gema [dotenv](https://github.com/bkeepers/dotenv). **Presta mucha atención si no quieres que te roben datos bancarios en Github.**

Y hay ¡**el último quiz**! No te pongas triste 😢

Miraremos hacia atrás para comprobar que hayas entendido los fundamentos de Rails.

## Segunda parte - AI Week

¡**AI Week**! En la segunda parte trabajarás con tu equipo de proyecto de 3 o 4. El objetivo es empezar desde cero y crear un Asistente de IA para una Persona y Objetivo - tendrás 5 bloques para llevar tu asistente de IA tan lejos como puedas.

- Primera demo a mitad de camino - Si es un bootcamp a tiempo completo, el miércoles (5 p.m.)
- **¡Demo oficial el último día!** Si es un bootcamp a tiempo completo, ¡el viernes! (5 p.m.)

**Esta semana no habrá sesión de código en vivo.** Sin embargo, tendrás clases matinales cubriendo IA y temas avanzados de Rails. Así que ¡levántate temprano! Aquí hay un resumen de lo que viene:

### `06 Intro to LLMs`

Clase matinal en 2 partes:
- Introducción a los LLMs. Construirás tu primera funcionalidad basada en IA usando [RubyLLM](https://rubyllm.com/) y entenderás los fundamentos de los LLMs para Ingenieros de Software.
- Autenticación (authentication) con la gema [Devise](https://github.com/plataformatec/devise).

### `07 Prompt Engineering`

Clase matinal en 2 partes:
- Ingeniería de Prompts. Aprenderás cómo escribir prompts efectivos para LLMs, lo cual es una habilidad crucial para dar forma al comportamiento de tu Asistente de IA.
- Técnicas de colaboración con git y Github. Descubrirás cómo trabajar en un equipo de desarrollo usando `branches` y `pull requests`. Es un sistema que usarás en cada proyecto de desarrollo que hagas, así que ¡presta atención!


### `08 Conversational UX`

Clase matinal en 2 partes:
- UX Conversacional: Permitir a los usuarios dar seguimiento a una primera respuesta del LLM proporcionando el historial de la conversación al LLM. Aprenderás cómo construir una UX conversacional en tu app Rails usando Turbo streams.
- JavaScript en Rails. Aprenderás cómo utilizar Stimulus e `importmap` para implementar nuevas características de JavaScript y utilizar bibliotecas de terceros en Rails.

Luego, cada grupo debe hacer una demostración de la versión actual de su Asistente de IA en frente de toda la clase.

### `09 Multi-modal Inference`

Inferencia Multi-modal. Aprenderás cómo enviar archivos junto con texto para ser procesados por LLMs.


### `10 Tools & Agents`

Clase matinal en 2 partes:
- Herramientas y Agentes. Aprenderás cómo escribir herramientas, permitir que el LLM decida cuándo usarlas, y dejar que el LLM llame APIs o consulte tu base de datos cuando sea relevante.
- WebSockets y ActionCable. Aprenderás cómo hacer streaming de respuestas en tiempo real para una mejor experiencia de usuario.


### Preparación de Proyectos (fin de semana)

¡Has hecho cosas increíbles y estamos muy orgullosos!

Es hora del Gran Final, los proyectos. Tómate un poco de tiempo durante el fin de semana para pensar en tus proyectos:

- Escribe las historias de tus usuarios/as (no más de 15).
- Haz maquetas en papel de tus vistas principales.
- Empieza creando tu esquema de base de datos (DB) en [kitt.lewagon.com/db](http://kitt.lewagon.com/db).
- Comienza a pensar en tus rutas.

Si puedes terminar la gran parte de todo esto ahorrarás mucho tiempo el lunes y podrás empezar tus proyectos sin demasiados problemas.
