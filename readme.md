# 🧪 Automatización de Pruebas API - PetStore

## 🎯 Descripción del Proyecto

Este proyecto contiene el *framework* de automatización de pruebas para los *endpoints* de la **API PetStore**. El objetivo principal es presentar la automatización del ejercicio propuesto.

---

## ⚙️ 1. Prerrequisitos

Para clonar, configurar y ejecutar las pruebas de forma local, asegúrate de tener instaladas las siguientes tecnologías y versiones. Es **obligatorio** que las variables de entorno de **Gradle** y **JDK** estén configuradas correctamente.

* **Sistema Operativo:** Microsoft Windows 11 Home (o equivalente en macOS/Linux).
* **IDE:** IntelliJ IDEA 2025.1.3 (Community Edition o Ultimate).
* **Java Development Kit (JDK):** Versión 17.0.x (Se recomienda la versión LTS más reciente).
    * *Variable de Entorno:* `JAVA_HOME` configurada.
* **Gradle:** Versión 7.6.1.
    * *Variable de Entorno:* `GRADLE_HOME` configurada.
* **Git:** Versión 2.30 o superior.

---

## 🛠️ 2. Comandos de Instalación

Una vez clonado el repositorio, la mayoría de las dependencias serán gestionadas por Gradle.

### Clonar el Repositorio

```bash
git clone https://github.com/HuAnPQ/sof-api-ponceh
cd sof-api-ponceh
```

### Descargar Dependencias y Ejecutar una Prueba de Integración

Este comando descargará todas las librerías definidas en el archivo build.gradle y ejecutará la suite de pruebas configurada por defecto, validando la correcta instalación.

```Bash
gradle clean test
```


---

## ▶️ 3. Instrucciones para Ejecutar los Tests

Las pruebas pueden ejecutarse desde la línea de comandos de manera total o parcial.

### Ejecución de la Suite Completa

Para ejecutar todas las pruebas automatizadas (Karate y Cucumber), utiliza el comando principal de Gradle:

```Bash
gradle test
```

### Ejecución Selectiva por Etiqueta (Tag)

Si deseas ejecutar un subconjunto de pruebas puedes utilizar la opción --tests junto con la etiqueta (tag) de Cucumber/Karate.

Ejemplo de ejecución solo para pruebas críticas @happyPathGetMod:

```Bash
gradle test --tests "*@happyPathGetMod"
```

### 📊 Generación y Acceso a Reportes

Al finalizar la ejecución, se generarán automáticamente los reportes de Karate y Cucumber.

Ruta de Reportes: `build/cucumber-html-reports/overview-features.html`

Acceso Rápido: Abre el archivo `index.html` en tu navegador para ver el resumen ejecutivo de la ejecución.

