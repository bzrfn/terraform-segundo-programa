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

## Archivos

| Archivo | Propósito |
| --- | --- |
| `terraform.tf` | Versiones requeridas de Terraform y AzureRM. |
| `variables.tf` | Entradas tipadas y validadas. |
| `locals.tf` | Convenciones de nombres y etiquetas comunes. |
| `providers.tf` | Configuración del provider AzureRM. |
| `main.tf` | Grupo de recursos y red virtual. |
| `outputs.tf` | Nombres, identificadores y espacio de direcciones. |
| `terraform.tfvars.example` | Ejemplo seguro sin identificadores reales. |

## Ejecución

La suscripción se suministra mediante una variable de entorno para evitar
guardar su identificador en el repositorio:

```bash
export TF_VAR_subscription_id="$(az account show --query id -o tsv)"
terraform fmt -check -recursive
terraform init -input=false
terraform validate
terraform plan -input=false -out=tfplan
terraform apply -input=false tfplan
terraform output
terraform plan -input=false -detailed-exitcode
```

## Resultado validado

La ejecución real se realizó el 3 de octubre de 2026 en Azure Cloud Shell:

- `Microsoft.Network`: `Registered`.
- Terraform: v1.16.4; AzureRM: v5.8.0.
- `terraform validate`: configuración válida.
- Grupo: `rg-brandonlab-dev-chilecentral-001` (`Succeeded`).
- VNet: `vnet-brandonlab-dev-chilecentral-001` (`Succeeded`).
- Espacio de direcciones: `10.0.0.0/16`.
- Comprobación final: `No changes. Your infrastructure matches the configuration.`

El primer intento en `mexicocentral` fue bloqueado por la directiva de regiones
de la suscripción. Se consultó la política efectiva, se eligió `chilecentral`
de la lista autorizada y se volvió a validar antes de aplicar el plan corregido.
