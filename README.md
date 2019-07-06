# Proyecto-II Digitales-II
Capa de transacción PCIE adaptada y lógica de conmutación.

# Integrantes:
* Giancarlo Marín Hernández - giancarlo.marin@ucr.ac.cr
* Moisés Campos Zepeda - moiso.camposcr@gmail.com
* Esteban Valverde Hernández - e.valverde95@hotmail.com

# Makefile
Los makefile se distribuyen con 4 reglas:

```bash
$ make compile    # compila el <archivo>.v

$ make synth      # genera la síntesis del módulo en <archivo>.v

$ make rename     # realiza todo el proceso de renaming del
                  # <arhivo_synth>.v

$ make tb         # visualiza las formas de onda de las pruebas
                  #completas con GTKWave del banco de pruebas.

$ make clean      # elimina archivos intermedios generados

$ make all        # ejecuta todos los procesos en el orden correcto
```


# Plan de trabajo propuesto
| Etapa | Actividad | Encargado | Tiempo  estimado (min) | Tiempo  dedicado (min)| Avance (%) | Fecha  de entrega | Comentarios |
|-------|-----------------------------|-----------|------------------------|------------------------|-------------------|-------------|-------------|
| 1 | Plan de pruebas | Todos | 300 | 400| 100 | 19/6/19 | Finalizado |
| 1-4 | Bitácora | Esteban | 90 | 120| 100 | 19/6/19 | Finalizado |
| 1 | Investigación | Giancarlo | 120 | 100| 100 | 19/6/19 | Finalizado |
| 1 | Memoria | Moisés | 120 | 100| 100 | 19/6/19 | Finalizado |
| 1 | FSM | Esteban | 180 | 200| 100 | 19/6/19 | Finalizado |
| 2 | FIFO | Todos | 300 | 400| 100 | 26/6/19 | Fianlizado |
| 3 | Interconexión completa | Todos | 400 | 500| 70 | 3/7/19 | En progreso |
| 4 | Reporte | Todos | 200 | 250 | 100 | 6/7/19 | Finalizado |
| 4 | Presentación | Todos | 180 | 180 | - | 10/7/19 | En progeso |


# Bitácora de trabajo

Se adjunta el link a la bitácora:
* https://docs.google.com/document/d/1xzHUImjI0QSKrw0qv1Gr2Ju_TENDb1Xis8uLT6ndQJ4/edit?usp=sharing
