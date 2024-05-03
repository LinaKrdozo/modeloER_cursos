-- DROP DATABASE IF EXISTS `playground`;
CREATE SCHEMA IF NOT EXISTS `playground` DEFAULT CHARACTER SET utf8 ;
USE `playground` ;

-- -----------------------------------------------------
-- Table `playground`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `categoria` (tipo_categoria) VALUES 
('Estudiante'), 
('Docente'), 
('Editor'), 
('Administrador');

-- -----------------------------------------------------
-- Table `playground`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45),
  `apellido` VARCHAR(45),
  `contraseña` VARCHAR(45) NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`, `categoria_id`),
  INDEX `fk_usuarios_categoria1_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `playground`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `usuarios` (nombre, apellido, contraseña, categoria_id) VALUES 
('Juan', 'Pérez', 'pass1234', 1), 
('Ana', 'Lopez', 'pass1234', 1), 
('Luis', 'Morales', 'pass1234', 1), 
('Carmen', 'Ruiz', 'pass1234', 1), 
('Mario', 'Gonzales', 'pass1234', 1), 
('Clara', 'Mendez', 'pass1234', 1), 
('Jose', 'Martinez', 'pass1234', 1), 
('Lucia', 'Garcia', 'pass1234', 1), 
('Marcos', 'Navarro', 'pass1234', 1), 
('Sofia', 'Vega', 'pass1234', 1), 
('Daniel', 'Santos', 'pass1234', 1), 
('Paula', 'Fernandez', 'pass1234', 1), 
('Jorge', 'Castillo', 'pass1234', 1), 
('Lorena', 'Alvarez', 'pass1234', 1), 
('David', 'Jimenez', 'pass1234', 1), 
('Elena', 'Diaz', 'pass1234', 1), 
('Carlos', 'Vidal', 'pass1234', 2),
('Isabel', 'Ortiz', 'pass1234', 2),
('Pedro', 'Ramirez', 'pass1234', 3),
('Rosa', 'Campos', 'pass1234', 4);
-- -----------------------------------------------------
-- Table `playground`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_finalizacion` DATE NOT NULL,
  `cupo_max` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `cursos` (titulo, descripcion, imagen, fecha_inicio, fecha_finalizacion, cupo_max) VALUES 
('Introducción a Python', 'Aprende Python desde cero', 'python.jpg', '2024-01-01', '2024-06-01', '30'),
('Fundamentos de JavaScript', 'JavaScript para principiantes', 'javascript.jpg', '2024-01-15', '2024-07-15', '25'),
('Desarrollo web con HTML y CSS', 'Construye tus primeras páginas web', 'html_css.jpg', '2024-02-01', '2024-08-01', '20'),
('Programación en Java', 'Java básico para novatos', 'java.jpg', '2024-03-01', '2024-09-01', '35'),
('C++ para ingenieros', 'Introducción al C++ en el contexto de la ingeniería', 'cpp.jpg', '2024-03-15', '2024-09-15', '40'),
('Desarrollo Backend con Node.js', 'Node.js para el desarrollo de aplicaciones backend', 'nodejs.jpg', '2024-04-01', '2024-10-01', '20'),
('Algoritmos y estructuras de datos', 'Conceptos avanzados de algoritmos', 'algorithms.jpg', '2024-05-01', '2024-11-01', '50');

-- -----------------------------------------------------
-- Table `playground`.`unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`unidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `cursos_id` INT NOT NULL,
  PRIMARY KEY (`id`, `cursos_id`),
  INDEX `fk_unidades_cursos1_idx` (`cursos_id` ASC) VISIBLE,
  CONSTRAINT `fk_unidades_cursos1`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `playground`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `unidades` (titulo, descripcion, fecha_inicio, cursos_id) VALUES 
('Fundamentos de Python', 'Introducción a los conceptos básicos de Python', '2024-01-05', 1),
('Estructuras de Datos en Python', 'Listas, diccionarios y más', '2024-01-12', 1),
('POO en Python', 'Introducción a la Programación Orientada a Objetos', '2024-01-19', 1),
('Bases de Datos en Python', 'Uso de SQLite y otros sistemas de bases de datos', '2024-01-26', 1),
('Proyectos Finales', 'Desarrollo de un proyecto final utilizando Python', '2024-02-02', 1),
('Introducción a JavaScript', 'Conceptos básicos de JavaScript', '2024-01-05', 2),
('DOM y Eventos', 'Manipulación del DOM y manejo de eventos', '2024-01-12', 2),
('JavaScript Asíncrono', 'Promesas, async y await', '2024-01-19', 2),
('Frameworks de JavaScript', 'Introducción a React o Angular', '2024-01-26', 2),
('Fundamentos de HTML', 'Estructura básica de páginas web', '2024-01-05', 3),
('Estilizando con CSS', 'Introducción a CSS', '2024-01-12', 3),
('Responsive Design', 'Diseño adaptable a diferentes dispositivos', '2024-01-19', 3),
('Proyecto Web', 'Creación de un sitio web completo', '2024-01-26', 3),
('Java Básico', 'Sintaxis y conceptos fundamentales de Java', '2024-01-05', 4),
('Java Intermedio', 'Conceptos intermedios incluyendo colecciones', '2024-01-12', 4),
('Java Avanzado', 'Temas avanzados en Java', '2024-01-19', 4),
('Java en la Web', 'Introducción a servlets y JSP', '2024-01-26', 4),
('C++ Fundamentals', 'Basics of C++ programming', '2024-01-05', 5),
('Object-Oriented Programming in C++', 'Deep dive into OOP with C++', '2024-01-12', 5),
('Advanced C++ Concepts', 'Exploring advanced topics like memory management', '2024-01-19', 5),
('Node.js Basics', 'Introduction to Node.js and its environment', '2024-01-05', 6),
('Express.js Framework', 'Building web applications using Express.js', '2024-01-12', 6),
('API Development', 'Creating RESTful APIs with Node.js', '2024-01-19', 6),
('Introduction to Algorithms', 'Basic algorithms and their complexity', '2024-01-05', 7),
('Data Structures', 'Important data structures for solving problems', '2024-01-12', 7),
('Sorting and Searching', 'Detailed study on sorting and searching algorithms', '2024-01-19', 7),
('Graph Algorithms', 'Exploration of graph-based algorithms', '2024-01-26', 7);


-- -----------------------------------------------------
-- Table `playground`.`usuarios_has_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`usuarios_has_cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarios_id` INT NOT NULL,
  `cursos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuarios_has_cursos_cursos1_idx` (`cursos_id` ASC) VISIBLE,
  INDEX `fk_usuarios_has_cursos_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_cursos_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `playground`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_cursos_cursos1`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `playground`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `usuarios_has_cursos` (usuarios_id, cursos_id) VALUES
(1, 1), 
(1, 2),
(1, 3),
(1, 4),
(2, 1), 
(2, 5),
(2, 7),
(2, 6), 
(2, 3),
(3, 2), 
(3, 3),
(4, 1), 
(4, 2), 
(4, 3),
(4, 5),
(4, 6),
(4, 7),
(5, 2),
(5, 3),
(5, 7), 
(6, 4), 
(7, 1), 
(8, 2), 
(8, 3),
(8, 4),
(9, 5), 
(9, 3),
(9, 1),
(9, 2),
(10, 6),
(11, 7),
(11, 6),
(11, 5),
(11, 4),
(11, 2),
(12, 1),
(12, 6),
(13, 2),
(13, 7),
(13, 4), 
(14, 3),
(15, 4),
(15, 1),
(15, 5),
(15, 3),
(16, 1),
(16, 2), 
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(17, 5),
(17, 6),
(17, 7),
(18, 6), 
(18, 7),
(19, 1), 
(19, 2),
(20, 2), 
(20, 3),
(20, 4);

-- -----------------------------------------------------
-- Table `playground`.`clases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`clases` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `marca_visibilidad` TINYINT(1) NOT NULL,
  `unidades_id` INT NOT NULL,
  PRIMARY KEY (`id`, `unidades_id`),
  INDEX `fk_clases_unidades1_idx` (`unidades_id` ASC) VISIBLE,
  CONSTRAINT `fk_clases_unidades1`
    FOREIGN KEY (`unidades_id`)
    REFERENCES `playground`.`unidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `clases` (titulo, descripcion, fecha_inicio, marca_visibilidad, unidades_id) VALUES 
('Introducción a Python', 'Conceptos básicos y configuración del entorno.', '2024-01-06', 1, 1),
('Variables y Tipos de Datos', 'Aprender sobre diferentes tipos de datos en Python.', '2024-01-13', 1, 1),
('Estructuras de Control', 'Instrucciones de control de flujo en Python.', '2024-01-20', 1, 2),
('Funciones y Módulos', 'Cómo crear y usar funciones y módulos.', '2024-01-27', 1, 2),
('Listas y Diccionarios', 'Manipulación de listas y diccionarios.', '2024-02-03', 1, 3),
('Excepciones y Manejo de Errores', 'Cómo manejar errores en Python.', '2024-02-10', 1, 3),
('Introducción a POO', 'Principios básicos de la Programación Orientada a Objetos.', '2024-02-17', 1, 4),
('Clases y Objetos', 'Creación de clases y objetos en Python.', '2024-02-24', 1, 4),
('Uso de Bases de Datos', 'Conexión y manipulación de bases de datos.', '2024-03-02', 1, 5),
('Proyecto Final', 'Desarrollo del proyecto final del curso.', '2024-03-09', 1, 5),
('Introducción a JavaScript', 'Primeros pasos en JavaScript.', '2024-01-06', 1, 6),
('Sintaxis Básica de JavaScript', 'Aprender la sintaxis básica de JavaScript.', '2024-01-13', 1, 6),
('Manipulación del DOM', 'Cómo interactuar con el Document Object Model.', '2024-01-20', 1, 7),
('Eventos en JavaScript', 'Manejar eventos del usuario en la web.', '2024-01-27', 1, 7),
('Asincronía en JavaScript', 'Promesas y callbacks en JavaScript.', '2024-02-03', 1, 8),
('Introducción a React', 'Primeros pasos con React.', '2024-02-10', 1, 8),
('Componentes en React', 'Cómo construir componentes en React.', '2024-02-17', 1, 9),
('Estado y Props', 'Gestión del estado y propiedades en React.', '2024-02-24', 1, 9),
('Proyecto Final en JavaScript', 'Desarrollo del proyecto final utilizando JavaScript y React.', '2024-03-02', 1, 9),
('Introducción a HTML', 'Fundamentos de HTML y su estructura.', '2024-02-01', 1, 13),
('Elementos y Etiquetas', 'Descripción de elementos básicos de HTML.', '2024-02-04', 1, 13),
('Formularios y Tablas', 'Creación de formularios y tablas en HTML.', '2024-02-07', 1, 13),
('Introducción a CSS', 'Conceptos básicos de CSS y cómo aplicar estilos.', '2024-02-10', 1, 14),
('Box Model', 'Comprensión del modelo de caja en CSS.', '2024-02-13', 1, 14),
('Flexbox', 'Uso de Flexbox para diseñar layouts flexibles.', '2024-02-16', 1, 14),
('CSS Grid', 'Introducción al CSS Grid para layouts complejos.', '2024-02-19', 1, 14),
('Media Queries', 'Adaptar aplicaciones web a diferentes tamaños de pantalla.', '2024-02-22', 1, 15),
('Frameworks Responsivos', 'Uso de Bootstrap para diseños responsivos.', '2024-02-25', 1, 15),
('Técnicas de Responsive Design', 'Prácticas avanzadas para diseño responsivo.', '2024-02-28', 1, 15),
('Planificación de Proyectos Web', 'Estrategias para la planificación y diseño de sitios web.', '2024-03-03', 1, 16),
('Desarrollo de un Sitio Web Completo', 'Integración de HTML, CSS y JavaScript en un proyecto.', '2024-03-06', 1, 16),
('Revisión y Despliegue de Sitio Web', 'Finalización y despliegue de un proyecto web.', '2024-03-09', 1, 16),
('Introducción a Java', 'Conceptos básicos de Java y configuración del entorno de desarrollo.', '2024-03-01', 1, 17),
('Sintaxis básica de Java', 'Aprender la sintaxis fundamental y estructuras de control en Java.', '2024-03-04', 1, 17),
('Colecciones en Java', 'Uso de interfaces de colecciones y clases en Java.', '2024-03-07', 1, 18),
('Java y la IO', 'Introducción a la entrada y salida en Java usando la API de Java IO.', '2024-03-10', 1, 18),
('Multithreading en Java', 'Conceptos y manejo de hilos en Java para la programación concurrente.', '2024-03-13', 1, 19),
('Introducción a C++', 'Primeros pasos con C++, instalación y configuración del entorno.', '2024-04-01', 1, 21),
('Variables y Tipos de Datos en C++', 'Comprensión de tipos de datos y variables en C++.', '2024-04-04', 1, 21),
('Control de Flujo', 'Estructuras de control como bucles y decisiones en C++.', '2024-04-07', 1, 21),
('Conceptos de POO', 'Introducción a la programación orientada a objetos con C++.', '2024-04-10', 1, 22),
('Clases y Objetos', 'Detalles sobre cómo definir clases y crear objetos en C++.', '2024-04-13', 1, 22),
('Gestión de Memoria', 'Administración de memoria en C++, incluyendo punteros y gestión de recursos.', '2024-04-16', 1, 23),
('Templates y STL', 'Uso de templates y la Standard Template Library para estructuras de datos eficientes.', '2024-04-19', 1, 23),
('Introducción a Node.js', 'Configuración del entorno y primeros pasos con Node.js.', '2024-04-01', 1, 24),
('Gestión de Paquetes con NPM', 'Uso de NPM para manejar librerías y paquetes.', '2024-04-04', 1, 24),
('Asincronía y Event Loop', 'Comprendiendo la asincronía y el ciclo de eventos en Node.js.', '2024-04-07', 1, 24),
('Introducción a Express.js', 'Creación de servidores web con Express.js.', '2024-04-10', 1, 25),
('Routing y Middlewares', 'Manejo de rutas y uso de middlewares en Express.', '2024-04-13', 1, 25),
('Manejo de Errores en Express', 'Estrategias para el manejo de errores y seguridad.', '2024-04-16', 1, 25),
('Integración de Bases de Datos', 'Conectar Node.js a bases de datos como MongoDB.', '2024-04-19', 1, 25),
('Desarrollo de APIs RESTful', 'Principios y prácticas para el desarrollo de APIs REST.', '2024-04-22', 1, 26),
('Autenticación y Seguridad', 'Implementación de autenticación y medidas de seguridad en APIs.', '2024-04-25', 1, 26);

-- -----------------------------------------------------
-- Table `playground`.`bloques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`bloques` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `contenido` VARCHAR(200) NOT NULL,
  `clases_id` INT NOT NULL,
  PRIMARY KEY (`id`, `clases_id`),
  INDEX `fk_bloques_clases1_idx` (`clases_id` ASC) VISIBLE,
  CONSTRAINT `fk_bloques_clases1`
    FOREIGN KEY (`clases_id`)
    REFERENCES `playground`.`clases` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `bloques` (titulo, tipo, contenido, clases_id) VALUES 
('Introducción a Python', 'Texto', 'Python es un lenguaje de programación interpretado, interactivo y orientado a objetos.', 1),
('Instalación de Python', 'Video', 'https://example.com/video-instalacion-python', 1),
('Configuración del Entorno de Desarrollo', 'PDF', 'https://example.com/pdf-configuracion-entorno-python', 1),
('Variables y Tipos de Datos', 'Texto', 'Variables en Python pueden ser de varios tipos: int, float, string, etc.', 1),
('Listas y Tuplas', 'Video', 'https://example.com/video-listas-tuplas-python', 1),
('Diccionarios y Conjuntos', 'PDF', 'https://example.com/pdf-diccionarios-conjuntos-python', 1),
('Definición de Funciones', 'Texto', 'Una función es un bloque de código organizado y reutilizable que realiza una acción específica.', 1),
('Parámetros y Argumentos', 'Video', 'https://example.com/video-parametros-argumentos-python', 1),
('Funciones Lambda y Recursivas', 'Presentación', 'https://example.com/presentacion-funciones-lambda-recursivas-python', 1),
('Programación Orientada a Objetos', 'Texto', 'La POO en Python permite estructurar programas de manera que las propiedades y comportamientos estén encapsulados en objetos.', 1),
('Clases y Objetos', 'Video', 'https://example.com/video-clases-objetos-python', 1),
('Métodos, Herencia y Polimorfismo', 'PDF', 'https://example.com/pdf-metodos-herencia-polimorfismo-python', 1),
('Implementación de Proyectos en Python', 'Texto', 'Aplicar todos los conceptos aprendidos para desarrollar proyectos completos en Python.', 1),
('Ejemplo de Proyecto: Web Scraper', 'Video', 'https://example.com/video-web-scraper-python', 1),
('Documentación y Pruebas', 'PDF', 'https://example.com/pdf-documentacion-pruebas-python', 1),

('¿Qué es JavaScript?', 'Texto', 'JavaScript es un lenguaje de programación interpretado que se utiliza principalmente en la web.', 2),
('Cómo incluir JavaScript en páginas web', 'Video', 'https://example.com/video-incluir-javascript', 2),
('Sintaxis básica de JavaScript', 'PDF', 'https://example.com/pdf-sintaxis-basica-javascript', 2),
('Document Object Model (DOM)', 'Texto', 'El DOM es una interfaz de programación para los documentos HTML y XML.', 2),
('Manipulación del DOM con JavaScript', 'Video', 'https://example.com/video-manipulacion-dom', 2),
('Eventos DOM y Listeners', 'Presentación', 'https://example.com/presentacion-eventos-dom', 2),
('Manejo de Eventos en JavaScript', 'Texto', 'Aprende cómo manejar eventos de usuario en JavaScript para crear interfaces interactivas.', 2),
('Asincronía en JavaScript', 'Video', 'https://example.com/video-asincronia-javascript', 2),
('Promesas y Async/Await', 'PDF', 'https://example.com/pdf-promesas-async-await', 2),
('Introducción a los Frameworks de JavaScript', 'Texto', 'Un vistazo a los frameworks más populares como Angular, React y Vue.', 2),
('Empezando con React', 'Video', 'https://example.com/video-empezando-react', 2),
('Componentes y Estado en React', 'Presentación', 'https://example.com/presentacion-componentes-estado-react', 2),

('Introducción a HTML', 'Texto', 'HTML es el lenguaje de marcado estándar para crear páginas web.', 3),
('Estructura básica de una página HTML', 'Video', 'https://example.com/video-estructura-html', 3),
('Elementos y Etiquetas HTML', 'PDF', 'https://example.com/pdf-elementos-etiquetas-html', 3),
('Introducción a CSS', 'Texto', 'CSS es el lenguaje utilizado para describir la presentación de documentos HTML.', 3),
('Selectores y Propiedades CSS', 'Video', 'https://example.com/video-selectores-propiedades-css', 3),
('Box Model en CSS', 'PDF', 'https://example.com/pdf-box-model-css', 3),
('Responsive Design', 'Texto', 'El diseño responsivo permite que las páginas web se vean bien en todos los dispositivos.', 3),
('Media Queries en CSS', 'Video', 'https://example.com/video-media-queries', 3),
('Flexbox: Manejo avanzado de layouts', 'Presentación', 'https://example.com/presentacion-flexbox', 3),
('CSS Grid: Una introducción', 'Texto', 'CSS Grid es una técnica de diseño poderosa para crear interfaces complejas y dinámicas.', 3),
('Implementando CSS Grid en Proyectos', 'Video', 'https://example.com/video-css-grid', 3),
('Transformaciones y Transiciones en CSS', 'PDF', 'https://example.com/pdf-transformaciones-transiciones', 3),
('Planificación de un Proyecto Web', 'Texto', 'Consideraciones clave al iniciar un proyecto web.', 3),
('Desarrollo de un Sitio Web Completo', 'Video', 'https://example.com/video-desarrollo-sitio-web', 3),
('Optimización y Mejoras del Sitio Web', 'Presentación', 'https://example.com/presentacion-optimizacion-mejoras-web', 3),

('¿Qué es Java?', 'Texto', 'Java es un lenguaje de programación orientado a objetos usado ampliamente para construir aplicaciones empresariales y web.', 4),
('Instalación de Java y Configuración del Entorno', 'Video', 'https://example.com/video-instalacion-java', 4),
('Tu Primer Programa en Java', 'PDF', 'https://example.com/pdf-primer-programa-java', 4),
('Estructuras de Control: If y Switch', 'Texto', 'Cómo utilizar las estructuras de control if y switch en Java.', 4),
('Bucles en Java: for y while', 'Video', 'https://example.com/video-bucles-java', 4),
('Ejemplos de Estructuras de Control', 'Presentación', 'https://example.com/presentacion-estructuras-control-java', 4),
('Introducción a la POO', 'Texto', 'Principios básicos de la programación orientada a objetos en Java.', 4),
('Clases, Objetos y Métodos', 'Video', 'https://example.com/video-clases-objetos-metodos-java', 4),
('Herencia y Polimorfismo', 'PDF', 'https://example.com/pdf-herencia-polimorfismo-java', 4),
('¿Qué son las Excepciones?', 'Texto', 'Entendiendo qué son las excepciones en Java y por qué son importantes.', 4),
('Try, Catch y Finally', 'Video', 'https://example.com/video-try-catch-finally-java', 4),
('Manejo de Excepciones: Prácticas Recomendadas', 'PDF', 'https://example.com/pdf-manejo-excepciones-java', 4),
('Fundamentos de Multithreading', 'Texto', 'Introducción a la programación multihilo en Java.', 4),
('Sincronización de Hilos', 'Video', 'https://example.com/video-sincronizacion-hilos-java', 4),
('Implementando Hilos con Runnable y Thread', 'PDF', 'https://example.com/pdf-implementando-hilos-java', 4),

('Introducción a C++', 'Texto', 'C++ es un lenguaje de programación de propósito general orientado a objetos, utilizado para desarrollar software complejo y sistemas operativos.', 5),
('Instalación del Compilador C++ y Configuración del Entorno', 'Video', 'https://example.com/video-instalacion-cpp', 5),
('Estructura Básica de un Programa en C++', 'PDF', 'https://example.com/pdf-estructura-basica-cpp', 5),
('Principios de la Programación Orientada a Objetos en C++', 'Texto', 'Explora los fundamentos de la POO incluyendo clases, objetos, métodos y más en C++.', 5),
('Clases y Objetos', 'Video', 'https://example.com/video-clases-objetos-cpp', 5),
('Herencia y Polimorfismo en C++', 'PDF', 'https://example.com/pdf-herencia-polimorfismo-cpp', 5),
('Introducción a las Plantillas en C++', 'Texto', 'Las plantillas permiten a los programadores implementar funcionalidad genérica que puede trabajar con cualquier tipo de datos.', 5),
('Usando la Standard Template Library (STL)', 'Video', 'https://example.com/video-stl-cpp', 5),
('Ejemplos Prácticos de Plantillas y STL', 'Presentación', 'https://example.com/presentacion-plantillas-stl-cpp', 5),
('Gestión de Memoria en C++', 'Texto', 'Aprende sobre la asignación, uso y liberación de memoria en C++.', 5),
('Punteros y Referencias', 'Video', 'https://example.com/video-punteros-referencias-cpp', 5),
('Manejo de Excepciones y Memoria', 'PDF', 'https://example.com/pdf-manejo-excepciones-memoria-cpp', 5),
('Desarrollando Software de Ingeniería con C++', 'Texto', 'Cómo C++ se utiliza en aplicaciones de ingeniería para soluciones robustas y eficientes.', 5),
('Optimización de Código en C++ para Ingeniería', 'Video', 'https://example.com/video-optimizacion-codigo-cpp', 5),
('Casos de Estudio: Proyectos de Ingeniería con C++', 'Presentación', 'https://example.com/presentacion-proyectos-ingenieria-cpp', 5),

('¿Qué es Node.js?', 'Texto', 'Node.js es un entorno de ejecución para JavaScript construido sobre el motor V8 de Chrome.', 6),
('Configuración del entorno Node.js', 'Video', 'https://example.com/video-configuracion-nodejs', 6),
('Hola Mundo en Node.js', 'PDF', 'https://example.com/pdf-hola-mundo-nodejs', 6),
('Introducción a Express.js', 'Texto', 'Express.js es un framework para aplicaciones web para Node.js.', 6),
('Creación de Rutas con Express.js', 'Video', 'https://example.com/video-creacion-rutas-expressjs', 6),
('Gestión de Rutas Avanzadas', 'Presentación', 'https://example.com/presentacion-gestion-rutas', 6),
('¿Qué es Middleware?', 'Texto', 'Middleware son funciones que tienen acceso al objeto de solicitud (request), el objeto de respuesta (response), y al siguiente middleware en el ciclo de solicitud-respuesta.', 6),
('Creación de Middleware Personalizado', 'Video', 'https://example.com/video-creacion-middleware', 6),
('Usos Prácticos de Middleware', 'PDF', 'https://example.com/pdf-usos-middleware', 6),
('Desarrollo de APIs REST', 'Texto', 'Aprende a construir APIs RESTful eficientes usando Node.js.', 6),
('Manejo de Solicitudes y Respuestas en APIs REST', 'Video', 'https://example.com/video-solicitudes-respuestas-api', 6),
('Seguridad y Autenticación en APIs', 'Presentación', 'https://example.com/presentacion-seguridad-api', 6),
('Conectar Node.js a Bases de Datos', 'Texto', 'Explora cómo conectar Node.js con diferentes tipos de bases de datos como MongoDB, PostgreSQL.', 6),
('Uso de Mongoose para MongoDB', 'Video', 'https://example.com/video-mongoose-mongodb', 6),
('Integración de Sequelize con SQL', 'PDF', 'https://example.com/pdf-sequelize-sql', 6),

('¿Qué es un Algoritmo?', 'Texto', 'Un algoritmo es un conjunto finito de instrucciones bien definidas para realizar una tarea o resolver un problema.', 7),
('Historia y Clasificación de Algoritmos', 'Video', 'https://example.com/video-historia-algoritmos', 7),
('Ejemplos de Algoritmos Simples', 'PDF', 'https://example.com/pdf-ejemplos-algoritmos-simples', 7),
('Introducción a las Estructuras de Datos', 'Texto', 'Las estructuras de datos son maneras de organizar la información en una computadora para que pueda ser utilizada eficientemente.', 7),
('Arrays y Listas Enlazadas', 'Video', 'https://example.com/video-arrays-listas-enlazadas', 7),
('Pilas y Colas', 'Presentación', 'https://example.com/presentacion-pilas-colas', 7),
('Árboles: Conceptos y Tipos', 'Texto', 'Exploración de diferentes tipos de árboles en ciencias de la computación, como árboles binarios, árboles AVL, árboles de segmentos.', 7),
('Grafos: Introducción y Aplicaciones', 'Video', 'https://example.com/video-grafos-introduccion', 7),
('Implementación de Árboles y Grafos', 'PDF', 'https://example.com/pdf-implementacion-arboles-grafos', 7),
('Métodos de Búsqueda', 'Texto', 'Descripción de varios algoritmos de búsqueda, como búsqueda lineal y búsqueda binaria.', 7),
('Algoritmos de Ordenación', 'Video', 'https://example.com/video-algoritmos-ordenacion', 7),
('Comparación y Eficiencia de Algoritmos de Ordenación', 'Presentación', 'https://example.com/presentacion-comparacion-ordenacion', 7),
('Algoritmos Divide y Vencerás', 'Texto', 'Conceptos básicos de algoritmos divide y vencerás, incluyendo ejemplos como QuickSort y MergeSort.', 7),
('Algoritmos de Programación Dinámica', 'Video', 'https://example.com/video-programacion-dinamica', 7),
('Aplicaciones de Algoritmos Greedy', 'PDF', 'https://example.com/pdf-algoritmos-greedy', 7);
