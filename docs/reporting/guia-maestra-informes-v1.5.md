# Guía Maestra para la Elaboración de Informes Profesionales
**Versión 1.5 · 13 de noviembre de 2026**

**Aplicación:** informes académicos, empresariales, financieros, técnicos, de investigación y de análisis de datos.

Esta versión parte de la Guía Maestra de Informes v1.4 y conserva sus normas útiles de presentación, rigor, interpretación, trazabilidad y revisión. Amplía su alcance, incorpora la sección de fluidez narrativa y cohesión analítica y permite adaptar la estructura y la disposición inicial a cada informe.

**Principio rector:** la guía debe adaptarse al informe. El informe debe permitir comprender qué se hizo, por qué se hizo, qué resultados se obtuvieron y qué significan, sin exigir conocimiento previo del proyecto.

## 1. Objetivo y aplicación de la guía

Elaborar informes rigurosos, profesionales, visualmente coherentes y fáciles de comprender. La redacción debe ser natural, directa y precisa; se priorizan la claridad sobre la complejidad del vocabulario y la calidad del razonamiento sobre la extensión.

Antes de redactar, identificar el propósito, el público, las preguntas u objetivos, el alcance, las fuentes disponibles y los requisitos de entrega. Estos elementos determinan qué apartados son necesarios, qué detalle requiere cada explicación y qué evidencia debe incorporarse.

Las instrucciones expresas del usuario, el enunciado, las normas de la institución o la plantilla acordada prevalecen sobre los valores predeterminados de esta guía. En revisiones de alcance limitado, conservar la estructura y el formato existentes salvo que se autorice cambiarlos. Una mejora de redacción no autoriza a alterar datos, metodología, resultados o conclusiones.

## 2. Formato y presentación

Las reglas siguientes constituyen el formato base para documentos paginados nuevos. Pueden adaptarse por requisitos institucionales, corporativos, editoriales o de accesibilidad, manteniendo consistencia y legibilidad. En Markdown o formatos sin páginas se conserva la jerarquía semántica; las medidas tipográficas y la paginación se aplican al exportar a un documento paginado.

- Utilizar Arial 12 y color negro en el cuerpo.
- Aplicar interlineado de 1,5, salvo que las características del documento justifiquen otra configuración.
- Justificar los párrafos del cuerpo.
- Aplicar una sangría de primera línea de 1,25 cm de forma uniforme. No se aplica a listas, tablas, títulos, leyendas, fuentes ni notas.
- Usar página A4 y márgenes de 2,5 cm. Los párrafos del cuerpo no llevan espacio posterior en el formato base; la separación se concentra en títulos, tablas y figuras.
- Mantener espaciados moderados y consistentes. Evitar saltos de línea innecesarios, bloques comprimidos y espacios excesivos.
- Incorporar numeración de páginas centrada en el pie, en Arial 10.
- Escribir las cifras en formato español, con punto para miles y coma para decimales, salvo que el idioma o la norma aplicable requieran otro sistema. No modificar literales de código, identificadores ni transcripciones que deban conservar su forma original.
- Usar espacios no separables entre cifras y símbolos, como "9,03 %", y dentro de expresiones que no convenga dividir, como "K = 3".
- Mantener unidades, símbolos, abreviaturas y precisión numérica uniformes.

### Comillas en todos los informes

- Utilizar exclusivamente comillas dobles rectas ASCII (`"`) para citar términos, opciones de herramientas, títulos cortos o expresiones entrecomilladas. No utilizar comillas angulares españolas ni comillas tipográficas curvas en ninguna parte del informe.
- Respetar las comillas que formen parte de código, fórmulas o literales técnicos que deban reproducirse exactamente; no alterarlos si ello modifica su significado.

### 2.1. Títulos principales

Escribir los títulos principales en MAYÚSCULAS, en negrita y con numeración correlativa, con el mismo tamaño y color que el cuerpo. Aplicar 18 pt antes y 6 pt después, y mantener cada título unido al párrafo siguiente.

Ejemplo: **3. RESULTADOS DEL ANÁLISIS**.

Usar estilos de título del editor para conservar la estructura, la navegación y la posibilidad de generar un índice automático. Una plantilla acordada puede establecer otra capitalización o numeración, siempre que la jerarquía sea clara y uniforme.

### 2.2. Subtítulos

Escribirlos en negrita, con capitalización ortográfica, numeración jerárquica y sangría de 0,63 cm respecto al título principal. Conservar la escritura exacta de nombres propios y términos técnicos, como PURCHASES o CREDIT_LIMIT.

Ejemplo: **3.1. Comparación de resultados**.

No crear niveles innecesarios ni dejar títulos aislados al final de una página.

### 2.3. Portada, índice y paginación

**Disposición inicial flexible.** En informes extensos o formales se permite una portada independiente, seguida del índice y del cuerpo en página nueva. En informes breves se puede colocar una cabecera con el título, el tipo de documento y una línea descriptiva junto al índice en la primera página. La cabecera o portada lleva el título en negrita y centrado. En documentos muy breves, el índice puede omitirse si no ayuda a la navegación o si así lo establece el encargo.

Como formato base, la primera página cuenta como página 1. Si una norma exige ocultar su número o utilizar otra secuencia, configurarla de manera expresa y verificar que el índice remita a la numeración visible correspondiente.

**Contenido del índice.**

- Incluir todos los títulos y subtítulos del cuerpo en idéntico orden, texto, numeración, ortografía y capitalización.
- Excluir la portada, el propio encabezado "ÍNDICE" y los marcadores de anexos pendientes.
- Incorporar solo contenido realmente presente. No incluir apartados vacíos para completar una plantilla.

**Formato del índice.**

- Arial 12, negro e interlineado de 1,25, como excepción al interlineado de 1,5 del cuerpo.
- Encabezado "ÍNDICE" en mayúsculas, negrita, alineado a la izquierda y con 8 pt de espacio inferior.
- Entradas principales en mayúsculas y negrita, sin sangría y con 5 pt de espacio anterior.
- Subtítulos sin negrita, con sangría izquierda de 0,63 cm, sin espacio anterior y con la misma escritura del cuerpo.
- Números de página alineados al margen derecho y con la misma negrita que su entrada.
- Preferir un tabulador derecho con relleno automático de puntos. Si el editor no lo admite, se permiten puntos de guía insertados en el texto y un tabulador derecho; ajustar la cantidad y verificar la alineación.
- Procurar entradas de una línea, sin cortar palabras ni dejar números sueltos. Para lograrlo, revisar los títulos y la distribución sin reducir la legibilidad. Si la extensión exige varias páginas de índice o una entrada larga, utilizar una continuación alineada y consistente, sin forzar compresión ni omitir contenido.

**Cálculo y verificación de páginas.**

Nunca estimar números de página. Maquetar el documento, exportarlo a PDF, localizar el inicio de cada título y subtítulo y actualizar el índice. Regenerar el PDF y comprobar de nuevo cuando esa actualización pueda desplazar contenido, hasta que las referencias sean estables.

Verificar visualmente las entradas, la alineación de números, los puntos de guía, los saltos y el ajuste de las páginas iniciales. En Word, preferir un índice automático con tabulador derecho y relleno de puntos, actualizable mediante "Actualizar campo".

La paginación verificada corresponde a la versión final exportada. Si cambia al abrir o editar el documento en otro programa, se debe actualizar el índice.

### 2.4. Tablas

- Colocar el título encima: etiqueta en negrita, como **Tabla 1.**, seguida de un título descriptivo en Arial 11.
- Situar la fuente y las notas debajo, en cursiva y Arial 10. Identificar la procedencia real, por ejemplo: "Fuente: elaboración propia a partir de…".
- Usar encabezados en negrita, centrados y con fondo gris claro D9D9D9, y bordes finos en gris 808080.
- Usar Arial 10, interlineado sencillo y margen interior en las celdas. Alinear el texto a la izquierda y centrar las cifras, salvo que el formato acordado requiera alinearlas por decimales.
- Mantener la misma precisión dentro de cada columna cuando la fuente lo permita. No añadir decimales que aparenten una precisión inexistente.
- Ajustar el ancho al espacio útil de la página y distribuir columnas según el contenido. Ningún encabezado debe partirse a mitad de palabra.
- Repetir el encabezado si la tabla continúa en otra página y evitar que una fila se divida. Las tablas pequeñas deben mantenerse juntas; si es necesario, comenzar en página nueva.
- Escribir "No disponible" cuando falte un dato. No confundir ausencia con cero ni completar con estimaciones. Si existe una diferencia relevante, distinguir "No aplica" de "No disponible".
- Indicar en las notas la base de los porcentajes, los cálculos propios y las diferencias de precisión o de origen.
- Mantener cerca el título, la tabla y su fuente. Revisar su lectura en el tamaño real de entrega.

### 2.5. Figuras, gráficos e imágenes

Incluir figuras cuando aclaren una comparación, distribución, tendencia, relación, proceso o evidencia. Elegir el tipo de gráfico según la pregunta que debe responder y evitar imágenes decorativas.

Usar un color sobrio o pocos colores bien diferenciados, sin cuadrículas pesadas. Los ejes deben indicar magnitudes y unidades. Colocar etiquetas directas cuando faciliten la lectura, sin solapamientos con los datos o los ejes. Si el tamaño o el color de un símbolo codifica información, explicarlo en el título, el texto o la leyenda.

Centrar la figura, respetar el ancho útil y conservar proporciones. Para imágenes rasterizadas, utilizar al menos 200 ppp en su tamaño de uso; preferir formatos vectoriales cuando corresponda. Incorporar texto alternativo. Situar el título encima y la fuente debajo con las mismas reglas de las tablas.

Las capturas deben conservar los parámetros y resultados relevantes y ser legibles en el documento final. No recortar información necesaria para interpretar o verificar la evidencia.

**Espacio tras tablas y figuras.** La fuente, nota o leyenda final de una tabla o figura debe separarse del párrafo narrativo siguiente mediante un espacio posterior visible y constante (referencia: 10–12 pt). Nunca debe quedar visualmente pegada al texto que continúa. Mantener juntos el título, el elemento gráfico o tabla y su fuente; distinguir el espacio posterior de la separación interna entre estos tres componentes. Comprobarlo de forma visual en todas las páginas exportadas.

### 2.6. Listas

Utilizar listas cuando los elementos sean diferenciables: objetivos, pasos, criterios, características o limitaciones. Usar numeración si el orden importa y viñetas si no importa. Las explicaciones e interpretaciones que requieran continuidad se desarrollan en párrafos.

Emplear listas reales del procesador de texto. Alinear la viñeta con la sangría de primera línea del cuerpo, sin añadir sangría de primera línea al texto de cada elemento. La frase introductoria termina en dos puntos; los elementos mantienen una estructura gramatical paralela y terminan en punto.

### 2.7. Numeración y referencias de tablas y figuras

Numerar tablas y figuras de forma correlativa e independiente en todo el documento: Tabla 1, Tabla 2; Figura 1, Figura 2. Mencionar cada una antes de su aparición y explicar su aportación sin repetir su leyenda. Verificar referencias después de mover, insertar o eliminar elementos.

## 3. Redacción y estructura narrativa

Cada apartado desarrolla una secuencia lógica de inicio, desarrollo y cierre: sitúa la pregunta o el objetivo, explica el trabajo y la evidencia pertinente e interpreta su significado. El cierre conecta con el siguiente apartado cuando resulte natural.

Esta secuencia no obliga a escribir tres párrafos ni a anunciar mecánicamente cada paso. La extensión responde al contenido. Agrupar ideas de un mismo tema con punto y seguido, evitando tanto la fragmentación como los bloques excesivamente largos.

Un apartado principal con subtítulos comienza con un párrafo breve que aporte contexto a su contenido. Evitar introducciones genéricas, repeticiones y explicaciones excesivamente técnicas. Definir los conceptos necesarios para el público y conservar la voz del autor al revisar.

Si dos apartados desarrollan lo mismo, unificarlos o utilizar referencias cruzadas cuando el alcance de la revisión permita reorganizarlos. No utilizar guiones largos o dobles guiones para enlazar ideas salvo que sean necesarios por razones ortográficas o técnicas; preferir puntuación convencional.

### 3.1. Fluidez narrativa y cohesión analítica

La redacción debe desarrollar un razonamiento continuo, evitando que los párrafos parezcan una enumeración de datos o resultados independientes.

- Integrar las cifras en explicaciones que relacionen los hallazgos con su significado.
- Evitar la acumulación de oraciones cortas y desconectadas.
- Utilizar comparaciones, contrastes y conectores cuando aporten continuidad.
- Alternar oraciones breves y extensas para mantener un ritmo natural.
- Desarrollar una idea central por párrafo, conectando los resultados con su interpretación.
- Evitar conectores artificiales, repeticiones y párrafos innecesariamente largos.
- Mantener siempre la precisión técnica y la fidelidad a los resultados originales.

Cada párrafo debe permitir reconocer qué se afirma, en qué evidencia se apoya y qué significa para el objetivo del informe. No es necesario expresar esos tres componentes mediante una fórmula fija. Los conectores deben describir la relación real entre las ideas: comparación, contraste, consecuencia respaldada, continuidad o limitación. No introducir causalidad ni certeza mediante el lenguaje si la evidencia no las demuestra.

La transición entre párrafos recupera el punto pertinente del anterior y abre el siguiente. Evitar empezar todos con la misma fórmula o añadir "además", "por tanto" o "en este sentido" cuando no aclaren la relación.

**Ejemplo ilustrativo, con cifras ficticias.** En lugar de "La media es 120. La mediana es 80. El máximo es 900", puede escribirse: "La media de 120 supera a la mediana de 80, mientras que el máximo alcanza 900. Este contraste aconseja describir también la posición central y la dispersión antes de interpretar el valor medio como representativo". La interpretación debe ajustarse a lo que los datos permitan concluir; no basta una mejora estilística para validar una explicación.

**Criterio de revisión obligatorio:** comprobar que el informe se lea como un análisis desarrollado y no como una sucesión de cifras. Leer también las transiciones entre frases, párrafos y apartados, sin apoyarse en las tablas para suplir relaciones que el texto debería explicar.

### 3.2. Relación entre texto y evidencia visual

No añadir frases cuya única función sea repetir lo que ya indica el título de una tabla o figura. Evitar fórmulas como "La Tabla 2 reúne estos estadísticos" o "La Figura 1 muestra el tamaño de cada segmento" si la leyenda inmediata ya lo expresa.

Antes del elemento, aportar el contexto, el método, la decisión o la pregunta necesaria. Después, interpretar los hallazgos relevantes sin transcribir todas las cifras. Se permiten referencias como "Tabla 2" o "Figura 1" cuando fundamenten una afirmación, orienten entre apartados o expliquen algo que la leyenda no comunica.

Revisar expresamente la última frase de cada párrafo anterior a una tabla o figura. Si solo duplica la leyenda, eliminarla o sustituirla por contexto útil. Cuando una tabla presente una selección de información, explicar qué parte incluye y dónde se encuentra el resto.

### 3.3. Precisión del lenguaje

Conservar literalmente los nombres de archivos, variables, fórmulas, modelos, procedimientos, recetas y herramientas cuando sean necesarios para identificar o reproducir el trabajo. Citar los nombres de configuraciones entre comillas angulares, "…".

Acompañar las cifras de unidades, periodos y referencias de comparación cuando corresponda. Cada porcentaje debe permitir identificar su denominador, en el texto o en una nota cercana. En distribuciones asimétricas, describir el caso habitual mediante mediana y cuartiles, además de la media cuando sea pertinente.

## 4. Estructura flexible y organización de la información

La estructura se elige por la finalidad y el público del informe. No se deben imponer apartados de datos, modelos, métricas o experimentos a trabajos que no los requieren. Tampoco debe omitirse una explicación necesaria porque no figure en una plantilla.

Como recorrido general, el lector debería poder encontrar el contexto y los objetivos, el alcance y las fuentes, el enfoque o procedimiento, la evidencia y su interpretación, las limitaciones y las conclusiones. Estas funciones pueden resolverse en apartados separados, combinarse o adoptar otros nombres. Un resumen ejecutivo, una revisión de literatura, recomendaciones o anexos se incorporan solo cuando aporten valor o sean exigidos.

| Tipo de informe | Apartados que pueden resultar útiles, según el encargo |
| --- | --- |
| Académico | Introducción y objetivos, marco conceptual, desarrollo o método, discusión, conclusiones y referencias. |
| Empresarial | Resumen ejecutivo, situación o problema, alternativas y criterios, análisis, implicaciones y recomendaciones. |
| Financiero | Objeto y periodo, fuentes y supuestos, análisis de magnitudes o escenarios, riesgos, sensibilidad y conclusiones. |
| Técnico | Problema y requisitos, alcance, diseño o procedimiento, implementación cuando corresponda, verificación, resultados y limitaciones. |
| Investigación | Pregunta, antecedentes, diseño, fuentes o muestra, método, resultados, discusión, limitaciones y conclusiones. |
| Analítica y datos | Problema, origen y calidad de los datos, preparación, método, resultados, interpretación, validación y límites. |

Estas orientaciones no son índices obligatorios ni justifican inventar fases que no se realizaron. En informes breves se pueden integrar resultados y discusión; en trabajos extensos puede ser útil separarlos. Los objetivos deben ser explícitos y verificables. Cuando sean varios, conviene enumerarlos y explicar brevemente la organización del documento.

Elegir el recurso que comunique con mayor claridad:

- **Párrafos:** explicaciones, razonamiento, interpretaciones y conclusiones.
- **Tablas:** comparaciones de elementos con medidas o criterios comunes; se prefieren cuando hay tres o más elementos comparables.
- **Listas:** objetivos, procedimientos, criterios o limitaciones diferenciados.
- **Gráficos:** tendencias, distribuciones y relaciones.
- **Cuadros o esquemas:** síntesis y procesos que necesiten una presentación diferenciada.

No convertir automáticamente todos los resultados en párrafos ni todas las ideas en listas. Evitar elementos decorativos y duplicidades entre texto, tablas y figuras.

## 5. Rigor, veracidad y trazabilidad

Todo dato debe proceder de una fuente verificable, de evidencia del trabajo o de cálculos reproducibles. Las fuentes se identifican de forma consistente mediante referencias, enlaces, notas o el sistema de citación exigido.

- No inventar cifras, métricas, fuentes, procedimientos ni resultados.
- Diferenciar hechos, interpretaciones, hipótesis, supuestos y recomendaciones. Si una explicación es compatible con los datos pero no se ha comprobado, indicarlo.
- No afirmar que una actividad se completó sin evidencia.
- Mantener consistencia en cifras, unidades, periodos, denominadores y redondeos.
- Explicar las limitaciones que condicionan el alcance de las conclusiones.
- No presentar correlaciones como relaciones causales sin evidencia suficiente.
- Conservar los términos técnicos necesarios y explicar su significado para el público.
- Hacer reproducibles los cálculos propios, como porcentajes, razones o sumas, y señalarlos en una nota de trazabilidad.
- Corregir anuncios de contenido que no esté presente o señalar su ausencia. No completarlos mediante suposiciones.
- Marcar las evidencias pendientes de forma visible, con resaltado amarillo en editores que lo permitan, y avisar al usuario. En texto plano o Markdown, utilizar una marca explícita de pendiente. No inventar capturas ni sustituirlas por una descripción que aparente ser evidencia.
- Comprobar que una misma cifra, con la misma precisión y base, coincida en texto, tablas, figuras y conclusiones. Si las fuentes presentan precisiones distintas, conservarlas y explicarlas.
- Señalar expresamente la información ausente y distinguirla de una observación nula, un cero o un resultado negativo.

Registrar el origen y la versión o fecha de corte de la evidencia cuando sean relevantes. La trazabilidad debe permitir reconstruir el razonamiento sin incorporar datos privados innecesarios al documento o a un repositorio público.

### 5.1. Redacción del proceso final y control de incidencias

- El informe final documentará el flujo de trabajo **efectivamente utilizado y validado**, no la cronología de pruebas, intentos fallidos, equivocaciones corregidas, versiones intermedias o depuración interna.
- No incluir frases sobre errores accidentales o su posterior corrección cuando estén completamente resueltos y no afecten a la interpretación de los resultados definitivos. Presentar directamente las transformaciones finales, sus verificaciones y los resultados vigentes.
- Mantener la integridad académica: si una incidencia conserva consecuencias en los datos, introduce una limitación relevante, afecta a la comparabilidad o el enunciado exige explicarla, debe documentarse con transparencia. Esta regla no autoriza ocultar problemas materiales ni inventar una metodología.
- En la revisión final, buscar y retirar expresiones de proceso interno ("primera versión", "lo corregimos", "se repitió tras un error", "se perdió por accidente") cuando no sean sustantivas para el lector.

## 6. Orientaciones especializadas, cuando correspondan

Estas orientaciones complementan las reglas generales. Solo se aplican cuando el objeto y el trabajo realizado las requieren.

### 6.1. Informes académicos y de investigación

Definir la pregunta y el alcance, relacionar el trabajo con los antecedentes pertinentes e identificar las fuentes. Explicar el diseño y el método con detalle suficiente para evaluar los resultados. Diferenciar la evidencia propia de la bibliografía y separar la interpretación de las limitaciones del diseño.

Adaptar citas, referencias, anexos y requisitos formales a la institución o publicación. No atribuir representatividad, validez externa o causalidad que el diseño no permita sostener.

### 6.2. Informes empresariales y financieros

Precisar la decisión o pregunta, el periodo, las unidades y el alcance. Distinguir cifras observadas de estimaciones, presupuestos, previsiones y escenarios. Identificar los supuestos y las fuentes que sostienen cada comparación.

Comparar alternativas con criterios homogéneos y explicar los riesgos, las dependencias y la incertidumbre relevantes. Si una recomendación depende de un supuesto o de información pendiente, hacerlo visible. Las recomendaciones deben estar respaldadas por el análisis presentado.

### 6.3. Informes técnicos

Explicar el problema, los requisitos y las restricciones pertinentes, las decisiones tomadas y cómo se verificaron. Separar lo implementado de lo propuesto o pendiente. Documentar versiones y condiciones de ejecución cuando sean necesarias para reproducir o evaluar el resultado.

Presentar las pruebas y sus límites de manera comprensible. No dar por demostrado un comportamiento más amplio que el efectivamente comprobado.

### 6.4. Informes de análisis de datos, Machine Learning e IA

Explicar el problema, los datos y sus características, la preparación, la metodología y su justificación, los resultados, su interpretación, las limitaciones y las posibles aplicaciones. Adaptar esta secuencia al enunciado sin añadir apartados innecesarios.

- Identificar el origen, la unidad de observación, la cobertura y la calidad de los datos.
- Justificar las decisiones de limpieza, transformación y selección de variables.
- Cuando se eliminen o separen registros, presentar una tabla de evolución del número de observaciones, desde el original hasta las etapas pertinentes, con la variación de cada una.
- Comparar modelos o parámetros mediante las mismas métricas y bases, en una tabla cuando proceda. Justificar la elección y reconocer si la ventaja es pequeña.
- Utilizar métricas apropiadas al problema y explicar qué significan y qué no demuestran.
- Distinguir valores originales, transformaciones y representaciones internas del modelo.
- Documentar las condiciones que afecten a la reproducibilidad y a la validez de la evaluación.
- Presentar limitaciones en una lista si son varias y de naturaleza distinta.
- Evitar que una agrupación descriptiva, una predicción o una asociación se convierta en una etiqueta causal o una decisión empresarial validada sin evidencia adicional.

## 7. Conclusiones y recomendaciones

Responder directamente a los objetivos o preguntas del inicio, uno a uno y en el mismo orden cuando estén enumerados. Sintetizar los hallazgos relevantes, explicar su significado y señalar las limitaciones que condicionan su alcance.

No repetir extensamente el desarrollo ni introducir resultados, cálculos o argumentos nuevos. Las recomendaciones y líneas futuras deben ser realistas, estar respaldadas por lo analizado y distinguirse de los hechos comprobados. Si el encargo no requiere recomendaciones, no añadirlas por rutina.

## 8. Revisión final obligatoria

Antes de dar por terminado el informe, comprobar:

- Que el propósito, el alcance y todos los requisitos del encargo estén atendidos.
- Que la estructura responda al contenido, sin apartados vacíos, duplicados o impuestos por una plantilla.
- Que la numeración, los títulos y el índice coincidan en texto y orden.
- Que los números del índice correspondan al PDF final maquetado.
- Que títulos, subtítulos, sangrías, espaciados y alineaciones sean uniformes.
- Que los títulos no contengan letras fuera de la negrita, restos del borrador, instrucciones internas o marcadores no resueltos.
- Que tablas y figuras estén identificadas, numeradas correlativamente y mencionadas antes de aparecer.
- Que lo anunciado en el texto coincida con lo mostrado en las evidencias.
- Que ninguna tabla pequeña quede dividida de forma poco legible, que las filas y encabezados se conserven correctamente y que las etiquetas no se solapen.
- Que las figuras y capturas sean legibles en el tamaño de entrega.
- Que no existan cifras contradictorias ni afirmaciones sin respaldo.
- Que porcentajes, unidades, periodos y cálculos propios permitan identificar sus bases y fuentes.
- Que no haya repeticiones innecesarias ni frases que dupliquen las leyendas.
- Que cada párrafo desarrolle una idea y que las frases y transiciones formen un razonamiento continuo.
- Que la redacción se lea como un análisis desarrollado, sin sucesiones inconexas de cifras ni conectores artificiales.
- Que conclusiones y recomendaciones respondan a los objetivos y respeten las limitaciones.
- Que todas las evidencias exigidas estén incorporadas o expresamente señaladas como pendientes.
- Que se haya revisado visualmente cada página del documento final, incluidos saltos, espacios, tablas, figuras, encabezados y pies.

La comprobación textual no sustituye la revisión visual. Si queda algún requisito pendiente, identificarlo con precisión y no presentar el trabajo como totalmente finalizado.

## 9. Conservación del original y entrega

Conservar el documento original y entregar una copia editable con un nombre que permita identificar la revisión, salvo que el usuario haya solicitado expresamente editar el original. Si ya existe una versión "revisada", distinguir la nueva sin sobrescribirla.

En una revisión de estilo, modificar únicamente lo autorizado. Comparar la versión final con la fuente para comprobar la conservación de cifras, metodología, resultados, conclusiones, tablas, figuras y formato cuando formen parte de las restricciones.

Entregar enlaces verificados y resumir brevemente qué cambió, qué se comprobó y qué queda pendiente. Mencionar cálculos nuevos, información no disponible o reordenaciones solo si los hubo. Ofrecer PDF cuando se solicite o sea necesario para una entrega con paginación estable, manteniendo también el editable.

Si se cambia de editor o se vuelve a modificar el contenido, comprobar la paginación y actualizar el índice cuando corresponda.

### 9.1. Uso en el repositorio

Esta guía regula la elaboración de informes. Los archivos README.md del portfolio se mantienen en inglés y resumen el problema, el enfoque, los resultados, las limitaciones y el acceso al código reproducible cuando corresponda. No deben copiar el informe completo ni imponer su formato paginado a la navegación del repositorio.

### 9.2. Cambios de la versión 1.5

- Alcance general para informes académicos, empresariales, financieros, técnicos, de investigación y de analítica.
- Incorporación de la sección 3.1, "Fluidez narrativa y cohesión analítica", acordada a partir de la v1.4.
- Estructura adaptable a la finalidad, el público y la evidencia, con orientaciones especializadas opcionales.
- Portada e índice configurables, incluida la posibilidad de portada independiente e índice en la segunda página.
- Índice proporcional a la extensión, conservando la exigencia de verificar sus páginas y referencias.
- Conservación de las normas de formato, tablas, figuras, rigor, trazabilidad, conclusiones, revisión visual y protección del original.
