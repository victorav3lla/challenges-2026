## AI Week - Demos intermedias

En este punto, deberías tener usuarios y una primera funcionalidad que funciona usando una API LLM, con un system prompt operativo.

Hoy deberías agregar el comportamiento de conversación en tu app para permitir a los usuarios **hacer seguimiento** a una respuesta LLM, **manteniendo el contexto** de los mensajes anteriores.

También, a medida que las conversaciones crezcan, asegúrate de controlar el consumo de tokens con las barreras de protección apropiadas, y corrige el comportamiento molesto de desplazamiento respondiendo con **Turbo Streams** en lugar de una redirección.

También, como viste durante la segunda clase, puedes refinar tu frontend y agregar **comportamiento interactivo en tu UI** con JavaScript, implementándolo con controladores Stimulus simples.

Por último, no olvides preparar tu **demo intermedia**: congela los despliegues a mitad de sesión y enfócate en probar tu recorrido de usuario hasta que sea perfecto. Todas las demos deben hacerse en producción, no se permite localhost. Asegúrate de preparar el entorno de producción con [seeds](https://kitt.lewagon.com/knowledge/cheatsheets/rails_seeds) bien pensados.