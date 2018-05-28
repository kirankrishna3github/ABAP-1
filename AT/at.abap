SENTENCIAS AT:
•	Las sentencias AT permiten controlar el procesamiento de una tabla interna, dentro de un LOOP. Sólo se usan por tanto dentro de bucles LOOP. Permiten ejecutar condicionalmente un bloque de sentencias, dentro del bucle, según se cumpla o no una u otra condición. Son: ATNEW, AT END OF, AT FIRST, AT LAST.
•	AT NEW campo. … ENDAT.
Con ATNEW se ejecuta el bloque cuando el campo especificado tiene un nuevo valor, es decir, que se activa al cambiar el campo su valor (se activa también en la primera vuelta, pues el campo pasará de INITIAL a su primer valor, pero no en la última vuelta, pues el campo no variará su valor). Puede convenir o no ordenar la tabla respecto ese campo.
•	AT END OF campo. … ENDAT.
Con AT END OF se ejecuta el bloque cuando el campo especificado alcanza su último valor. Puede convenir o no ordenar la tabla por ese campo.
•	AT FIRST.…ENDAT.
Con AT FIRST se ejecuta el bloque en la primera vuelta del LOOP.
•	AT LAST.…ENDAT.
Con AT LAST se ejecuta el bloque en la última vuelta del LOOP.
•	Dentro de ATNEW y ATEND OF, la sentencia SUM suma todos los campos numéricos de las entradas procesadas en estos bloques de proceso. Dentro de AT FIRST y AT LAST, suma los campos numéricos de todas las entradas de la tabla.
