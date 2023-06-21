#ifndef __CONEX_H__
#define __CONEX_H__
#include <mysql/mysql.h>

MYSQL_RES *mysql_execure_query(MYSQL *, const char *);
void imprimir_menu();
void realizar_opcion(int, MYSQL *);

// el nombre dice que hace
void imprimir_tipos(MYSQL *);
void imprimir_idiomas(MYSQL *);
void imprimir_roles(MYSQL *);
void imprimir_peliculas(MYSQL *);
void imprimir_generos(MYSQL *);
void imprimir_sagas(MYSQL *);
void imprimir_premios(MYSQL *);
void imprimir_peliculas_titulo_original(MYSQL *);
void imprimir_participacion_peliculaTitulo_personaNombre(MYSQL *);

// Opcion 1 (agregar idioma)
void agregar_idioma(MYSQL *);

// Opcion 2 (agregar genero)
void agregar_genero(MYSQL *);

// Opcion 3 (agregar saga)
void agregar_saga(MYSQL *);

// Opcion 4 (agregar premio)
void agregar_premio(MYSQL *);

// Opcion 5 (agregar rol)
void agregar_rol(MYSQL *);

// Opcion 6 (agregar persona)
void agregar_persona(MYSQL *);

// Opcion 7 (agregar pelicula)
void agregar_pelicula(MYSQL *);

// Opcion 8 (agregar titulo a pelicula)
void agregar_titulo_pelicula(MYSQL *);

// Opcion 9 (agregar titulo a saga)
void agregar_titulo_saga(MYSQL *);

// Opcion 10 (agregar pelicula a saga)
void agregar_pelicula_saga(MYSQL *);

// Opcion 11 (agregar nominacion a pelicula)
void agregar_nominacion_pelicula(MYSQL *);

// Opcion 12 (agregar persona a participacion)
void agregar_persona_participacion_pelicula(MYSQL *);

// Opcion 13 (agregar genero a pelicula)
void agregar_genero_pelicula(MYSQL *);

// Opcion 14 (agregar personaje a persona)
void agregar_personaje(MYSQL*);

#endif
