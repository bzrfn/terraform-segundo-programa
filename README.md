# Terraform — Segundo Programa

Práctica académica basada en el material de `segundo-programa` del repositorio
`jorgealmeidamontiel/terraform-laboratories`.

El proyecto despliega en Microsoft Azure:

- un grupo de recursos;
- una red virtual con espacio de direcciones configurable;
- etiquetas y nombres estandarizados mediante variables y valores locales;
- salidas para comprobar los recursos creados.

## Requisitos

- Terraform 1.13.0 o posterior.
- Azure CLI con una sesión válida.
- Suscripción de Azure con permisos para crear un grupo de recursos y una red virtual.
- Provider de recursos `Microsoft.Network` registrado.

La región predeterminada es `chilecentral`. La suscripción académica aplicó una
directiva de regiones permitidas (`westus`, `belgiumcentral`, `northcentralus`,
`francecentral` y `chilecentral`), por lo que `mexicocentral`, usada en el
material de referencia, no estaba autorizada durante la ejecución real.

## Seguridad del repositorio

Los archivos de estado, el directorio `.terraform`, los planes y los archivos
`*.tfvars` locales se excluyen mediante `.gitignore`. No se publican tokens,
credenciales ni identificadores reales de suscripción.

La secuencia de ejecución y validación se documentará al completar la práctica
con la suscripción autorizada.
