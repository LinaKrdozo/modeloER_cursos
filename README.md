# Desafios Digital House 

*el microdesafio realizado corresponde al curso de fullstack node del modulo 5: Bases de datos:*

Micro desafío 1 - Los usuarios y los cursos:
Queremos tener usuarios, los usuarios tendrán nombre, apellido, email, contraseña y
categoría. Los usuarios podrán tener categoría de estudiantes, docentes, editores o
administradores.
Lo siguiente que queremos es poder almacenar los cursos, que tendrán un título, una
descripción, una imagen, una fecha de inicio, una fecha de finalización y un cupo máximo.
Los cursos tendrán unidades (para organizar el contenido) que tendrán un título, una
descripción y una fecha de inicio.
Los usuarios (de cualquier tipo) podrán estar asociados a cursos.

Micro desafío 2 - El contenido del curso:
Las unidades contendrán clases que también tendrán un título, una descripción, una
fecha de inicio, y una marca de visibilidad (si el bloque está visible o no).
Las clases contendrán bloques. Los bloques tendrán un título y una marca de visibilidad.
Los bloques podrán ser de diferente tipo: texto, video, presentación, PDF o archivo.
Los bloques también tendrán que poder guardar el contenido, sea texto o una URL, en
caso de que el tipo sea video, presentación, PDF o archivo.*

### ✔️ Tecnologias utilizadas
- MySql
- workbench
    
### 🚀 Requerimientos 
```
 Mysql== 8.1.25
```

### 🛠️ Abre y ejecuta el proyecto
para ejecutar el proyecto en local:
1. Se descarga el proyecto comprimido o se clona de GitHub
   ```
    git clone https://github.com/LinaKrdozo/modeloER_cursos.git
   ```
2. Al tener el proyecto en el ordenador, se abren los archivos usando workbench
3. se ingresa a la conexion correspondiente
4. y se abren los archivos conb extencion sql:
    ```
    file --> open SQL script
   ```
