#include <mysql/mysql.h>
#include <stdio.h>
#include <string.h>
#include "conexion.h"

int main()
{
	MYSQL *conn;
	char *server = "localhost";
	char *user = "root";
	char *password = "estafraseEsMuysegura1#"; /* set me first */
	char *database = "omdb";
	conn = mysql_init(NULL);
	/* Connect to database */
	if (!mysql_real_connect(conn, server,
													user, password, database, 0, NULL, 0))
	{
		fprintf(stderr, "%s\n", mysql_error(conn));
		exit(1);
	}

	int opcion;
	do
	{
		imprimir_menu();
		printf("Que hacer:");
		scanf("%d", &opcion);
		while (getchar() != '\n')
			;
		realizar_opcion(opcion, conn);
	} while (opcion);

	/* close connection */
	mysql_close(conn);

	return 0;
}

MYSQL_RES *mysql_execute_query(MYSQL *connection, const char *sql_query)
{
	if (mysql_query(connection, sql_query))
	{
		printf("MySQL Query Error: %s \n", mysql_error(connection));
		exit(1);
	}

	return mysql_use_result(connection);
}

void imprimir_menu()
{
	printf("1- Nuevo idioma\n");
	printf("2- Nuevo genero\n");
	printf("3- Nueva Saga\n");
	printf("4- Nuevo premio\n");
	printf("5- Nuevo rol\n");
	printf("6- Nueva persona\n");
	printf("7- Nueva Pelicula\n");
	printf("8- Agregar titulo a prlicula\n");
	printf("9- Agregar titulo a saga\n");
	printf("10- Agregar pelicula a saga\n");
	printf("11- Agregar nominacion a pelicula\n");
	printf("12- Agregar persona a participacion en pelicula\n");
	printf("13- Agregar genero a pelicula\n");
	printf("14- Agregar personaje\n");
	printf("0- Salir\n");
}

void realizar_opcion(int opcion, MYSQL *conn)
{

	switch (opcion)
	{

	case 0:
		break;
	case 1:
		agregar_idioma(conn);
		break;
	case 2:
		agregar_genero(conn);
		break;
	case 3:
		agregar_saga(conn);
		break;
	case 4:
		agregar_premio(conn);
		break;
	case 5:
		agregar_rol(conn);
		break;
	case 6:
		agregar_persona(conn);
		break;
	case 7:
		agregar_pelicula(conn);
		break;
	case 8:
		agregar_titulo_pelicula(conn);
		break;
	case 9:
		agregar_titulo_saga(conn);
		break;
	case 10:
		agregar_pelicula_saga(conn);
		break;
	case 11:
		agregar_nominacion_pelicula(conn);
		break;
	case 12:
		agregar_persona_participacion_pelicula(conn);
		break;
	case 13:
		agregar_genero(conn);
		break;
	case 14:
		agregar_personaje(conn);
		break;
	default:
		printf("Opcion inexistente!");
		break;
	}
}

void imprimir_idiomas(MYSQL *conn)
{
	MYSQL_RES *res;
	MYSQL_ROW row;
	if (mysql_query(conn, "select * from Idiomas;"))
	{
		fprintf(stderr, "%s\n", mysql_error(conn));
		exit(1);
	}
	res = mysql_use_result(conn);
	printf("ID\t|\tIdioma\n");
	printf("--------------------------\n");
	while ((row = mysql_fetch_row(res)) != NULL)
		printf("%s\t|\t%.30s\n", row[0], row[1]);
	mysql_free_result(res);
}

void imprimir_peliculas(MYSQL *conn)
{
	MYSQL_RES *res;
	MYSQL_ROW row;
	if (mysql_query(conn, "select * from Peliculas;"))
	{
		fprintf(stderr, "%s\n", mysql_error(conn));
		exit(1);
	}
	res = mysql_use_result(conn);
	printf("ID\t|\tResumen\n");
	printf("-----------------------------------------------------\n");
	while ((row = mysql_fetch_row(res)) != NULL)
		printf("%s\t|\t%.*s\n", row[0], 50, row[7]);
	mysql_free_result(res);
}

void imprimir_peliculas_titulo_original(MYSQL *conn)
{
	MYSQL_RES *res;
	MYSQL_ROW row;
	if (mysql_query(conn, "SELECT P.ID, T.Titulo FROM Peliculas P INNER JOIN Titulos T ON P.ID = T.id_Pelicula WHERE T.id_Idioma = P.id_IdiomaOriginal;"))
	{
		fprintf(stderr, "%s\n", mysql_error(conn));
		exit(1);
	}
	res = mysql_use_result(conn);
	printf("ID\t|\tTitulo\n");
	printf("-----------------------------------------------------\n");
	while ((row = mysql_fetch_row(res)) != NULL)
		printf("%s\t|\t%s\n", row[0], row[1]);
	mysql_free_result(res);
}

void imprimir_roles(MYSQL *conn)
{
        MYSQL_RES *res;
        MYSQL_ROW row;
        if (mysql_query(conn, "select * from Roles;"))
        {
                fprintf(stderr, "%s\n", mysql_error(conn));
                exit(1);
        }
        res = mysql_use_result(conn);
        printf("ID\t|\tDescripcion\n");
        printf("-----------------------------------------------------\n");
        while ((row = mysql_fetch_row(res)) != NULL)
                printf("%s\t|\t%s\n", row[0], row[1]);
        mysql_free_result(res);
}

void imprimir_personas(MYSQL *conn)
{
        MYSQL_RES *res;
        MYSQL_ROW row;
        if (mysql_query(conn, "select ID, Nombre, Apellido from Personas;"))
        {
                fprintf(stderr, "%s\n", mysql_error(conn));
                exit(1);
        }
        res = mysql_use_result(conn);
        printf("ID\t|\tNombre\t|\tApellidon\n");
        printf("-----------------------------------------------------\n");
        while ((row = mysql_fetch_row(res)) != NULL)
                printf("%s\t|\t%s\t|\t%s\n", row[0], row[1], row[2]);
        mysql_free_result(res);
}

void imprimir_sagas(MYSQL *conn)
{
	MYSQL_RES *res;
	MYSQL_ROW row;
	if (mysql_query(conn, "select * from Sagas;"))
	{
		fprintf(stderr, "%s\n", mysql_error(conn));
		exit(1);
	}
	res = mysql_use_result(conn);
	printf("ID\t|\tDescripcion\n");
	printf("-----------------------------------------------------\n");
	while ((row = mysql_fetch_row(res)) != NULL)
		printf("%s\t|\t%s\n", row[0], row[1]);
	mysql_free_result(res);
}

void imprimir_tipos(MYSQL *conn)
{
        MYSQL_RES *res;
        MYSQL_ROW row;
        if (mysql_query(conn, "select * from TiposPersonajes;"))
        {
                fprintf(stderr, "%s\n", mysql_error(conn));
                exit(1);
        }
        res = mysql_use_result(conn);
        printf("ID\t|\tDescripcion\n");
        printf("-----------------------------------------------------\n");
        while ((row = mysql_fetch_row(res)) != NULL)
                printf("%s\t|\t%s\n", row[0], row[1]);
        mysql_free_result(res);
}

void imprimir_premios(MYSQL *conn)
{
	MYSQL_RES *res;
	MYSQL_ROW row;
	if (mysql_query(conn, "select * from Premios;"))
	{
		fprintf(stderr, "%s\n", mysql_error(conn));
		exit(1);
	}
	res = mysql_use_result(conn);
	printf("ID\t|\tDescripcion\n");
	printf("-----------------------------------------------------\n");
	while ((row = mysql_fetch_row(res)) != NULL)
		printf("%s\t|\t%.*s\n", row[0], 50, row[7]);
	mysql_free_result(res);
}

void imprimir_generos(MYSQL *conn)
{
	MYSQL_RES *res;
	MYSQL_ROW row;
	if (mysql_query(conn, "select * from Generos;"))
	{
		fprintf(stderr, "%s\n", mysql_error(conn));
		exit(1);
	}
	res = mysql_use_result(conn);
	printf("ID\t|\tDescripcion\n");
	printf("-----------------------------------------------------\n");
	while ((row = mysql_fetch_row(res)) != NULL)
		printf("%s\t|\t%s\n", row[0], row[7]);
	mysql_free_result(res);
}

void agregar_idioma(MYSQL *conn)
{
	char idioma[50];
	printf("Ingrese el nombre del nuevo idioma:");
	scanf("%[^\n]", idioma);
	char query[1000] = "INSERT INTO Idiomas (Descripcion) VALUES ('";
	char *parteFinal = "');";
	strcat(query, idioma);
	strcat(query, parteFinal);
	mysql_execute_query(conn, query);
}

void agregar_genero(MYSQL *conn)
{
	char genero[50];
	printf("Ingrese el nombre del nuevo genero:");
	scanf("%[^\n]", genero);
	char query[1000] = "INSERT INTO Generos (Descripcion) VALUES ('";
	char *parteFinal = "');";
	strcat(query, genero);
	strcat(query, parteFinal);
	mysql_execute_query(conn, query);
}

void agregar_saga(MYSQL *conn)
{
	char saga[50];
	printf("Ingrese el nombre de la nueva saga:");
	scanf("%[^\n]", saga);
	char query[1000] = "INSERT INTO Sagas (Descripcion) VALUES ('";
	char *parteFinal = "');";
	strcat(query, saga);
	strcat(query, parteFinal);
	mysql_execute_query(conn, query);
}

void agregar_premio(MYSQL *conn)
{
	char premio[50];
	printf("Ingrese el nombre del nuevo premio:");
	scanf("%[^\n]", premio);
	char query[1000] = "INSERT INTO Premios (Descripcion) VALUES ('";
	char *parteFinal = "');";
	strcat(query, premio);
	strcat(query, parteFinal);
	mysql_execute_query(conn, query);
}

void agregar_rol(MYSQL *conn)
{
	char rol[65];
	printf("Ingrese el nombre del nuevo rol:");
	scanf("%[^\n]", rol);
	char query[1000] = "INSERT INTO Roles (Descripcion) VALUES ('";
	char *parteFinal = "');";
	strcat(query, rol);
	strcat(query, parteFinal);
	mysql_execute_query(conn, query);
}

void agregar_persona(MYSQL *conn)
{
	char campo[256];
	char fechaNacimiento[12];
	char genero[16];
	char query[1500] = "INSERT INTO Personas (Nombre, Apellido, FechaDeNacimiento, Genero, LugarDeNacimiento) VALUES ('";
	char *separador = "', '";
	char *parteFinal = "');";

	printf("Ingrese el nombre de la persona:");
	scanf("%[^\n]", campo);
	while (getchar() != '\n')
		;
	strcat(query, campo);
	strcat(query, separador);

	printf("Ingrese el apellido:");
	scanf("%[^\n]", campo);
	while (getchar() != '\n')
		;
	strcat(query, campo);
	strcat(query, separador);

	printf("Ingrese la fecha de nacimiento:");
	scanf("%[^\n]", fechaNacimiento);
	while (getchar() != '\n')
		;
	strcat(query, fechaNacimiento);
	strcat(query, separador);

	printf("Ingrese el genero de la persona:");
	scanf("%[^\n]", genero);
	while (getchar() != '\n')
		;
	strcat(query, genero);
	strcat(query, separador);

	printf("Ingrese el lugar de nacimiento:");
	scanf("%[^\n]", campo);
	while (getchar() != '\n')
		;
	strcat(query, campo);
	strcat(query, parteFinal);
	mysql_execute_query(conn, query);
}

void agregar_pelicula(MYSQL *conn)
{
	int idioma; // FK
	char fechaPublicacion[12];
	int duracion;
	int presupuesto;
	int recaudacion;
	char rating[6];
	char resumen[10000]; // si con esto no alcanza despues lo modificamos
	char query[50000];

	imprimir_idiomas(conn);
	printf("Ingrese el idioma original de la pelicula:");
	scanf("%d", &idioma);
	while (getchar() != '\n')
		;

	printf("Ingrese la fecha de publicacion:");
	scanf("%[^\n]", fechaPublicacion);
	while (getchar() != '\n')
		;

	printf("Ingrese la duracion de la pelicula:");
	scanf("%d", &duracion);
	while (getchar() != '\n')
		;

	printf("Ingrese la presupuesto de la pelicula:");
	scanf("%d", &presupuesto);
	while (getchar() != '\n')
		;

	printf("Ingrese la recaudacion de la pelicula:");
	scanf("%d", &recaudacion);
	while (getchar() != '\n')
		;

	printf("Ingrese el rating de la pelicula:");
	scanf("%[^\n]", rating);
	while (getchar() != '\n')
		;

	printf("Ingrese un resumen de la pelicula:");
	scanf("%[^\n]", resumen);
	while (getchar() != '\n')
		;

	sprintf(query, "INSERT INTO Peliculas (id_IdiomaOriginal, AnioPublicacion, Duracion, Presupuesto, RecaudacionTaquilla, Rating, Resumen) VALUES ('%d', '%s', '%d', '%d', '%d', '%s', '%s');", idioma, fechaPublicacion, duracion, presupuesto, recaudacion, rating, resumen);
	mysql_execute_query(conn, query);
}

void imprimir_participacion_peliculaTitulo_personaNombre(MYSQL *conn)
{
	MYSQL_RES *res;
	MYSQL_ROW row;
	if (mysql_query(conn, "SELECT Part.ID AS ID, Titulos.Titulo AS Pelicula, CONCAT(Personas.Nombre, ' ', Personas.Apellido) AS Persona FROM Participacion Part INNER JOIN Personas ON Part.id_Persona = Personas.ID INNER JOIN Peliculas ON Part.id_Pelicula = Peliculas.ID INNER JOIN Titulos ON Peliculas.ID = Titulos.id_Pelicula WHERE Titulos.id_Idioma = Peliculas.id_IdiomaOriginal;"))
	{
		fprintf(stderr, "%s\n", mysql_error(conn));
		exit(1);
	}
	res = mysql_use_result(conn);
	printf("ID\t|\tPelicula|\tPersona\n");
	printf("-----------------------------------------------------\n");
	while ((row = mysql_fetch_row(res)) != NULL)
		printf("%s\t|\t%s\t|\t%s\n", row[0], row[1], row[2]);
	mysql_free_result(res);
}

void agregar_titulo_pelicula(MYSQL *conn)
{
	char query[1000];
	char titulo[256];
	int idioma;		// FK
	int pelicula; // FK

	printf("Ingrese el titulo de la pelicula:");
	scanf("%[^\n]", titulo);
	while (getchar() != '\n')
		;

	imprimir_peliculas(conn);
	printf("Ingrese a que pelicula corresponde el  titulo:");
	scanf("%d", &pelicula);
	while (getchar() != '\n')
		;

	imprimir_idiomas(conn);
	printf("Ingrese en que idioma esta este titulo:");
	scanf("%d", &idioma);
	while (getchar() != '\n')
		;

	sprintf(query, "INSERT INTO Titulos (Titulo, id_Idioma, id_Pelicula) VALUES ('%s', '%d', '%d')", titulo, idioma, pelicula);
	mysql_execute_query(conn, query);
}

void agregar_titulo_saga(MYSQL *conn)
{
	char query[1000];
	char titulo[256];
	int idioma;
	int saga;

	printf("Ingrese el titulo de la saga: ");
	scanf("%[^\n]", titulo);
	while (getchar() != '\n')
		;

	imprimir_sagas(conn);
	printf("Ingrese a que saga corresponde el titulo: ");
	scanf("%d", &saga);
	while (getchar() != '\n')
		;

	imprimir_idiomas(conn);
	printf("Ingrese en que idioma esta este titulo:");
	scanf("%d", &idioma);
	while (getchar() != '\n')
		;

	sprintf(query, "INSERT INTO TitulosSagas (Titulo, id_Idioma, id_Saga) VALUES ('%s', '%d', '%d')", titulo, idioma, saga);
	mysql_execute_query(conn, query);
}

void agregar_pelicula_saga(MYSQL *conn)
{
	int pelicula;
	int saga;
	int orden;
	char query[1000];

	imprimir_peliculas_titulo_original(conn);
	printf("Elija la pelicula:");
	scanf("%d", &pelicula);
	while (getchar() != '\n')
		;

	imprimir_sagas(conn);
	printf("Elija la saga:");
	scanf("%d", &saga);
	while (getchar() != '\n')
		;

	printf("En que orden pertenece la pelicula en la saga:");
	scanf("%d", &orden);
	while (getchar() != '\n')
		;

	sprintf(query, "INSERT INTO PeliculasEnSagas (id_Pelicula, id_Saga, Orden) VALUES ('%d', '%d', '%d')", pelicula, saga, orden);
	mysql_execute_query(conn, query);
}

void agregar_nominacion_pelicula(MYSQL *conn)
{
	char query[1000];
	int premio;
	int pelicula;
	int estado = 0;

	imprimir_premios(conn);
	printf("Seleccione el premio de la nominacion: ");
	scanf("%d", &premio);
	while (getchar() != '\n')
		;

	imprimir_peliculas(conn);
	printf("Seleccione la pelicula nominada: ");
	scanf("%d", &pelicula);
	while (getchar() != '\n')
		;

	while (estado != 1 && estado != 2)
	{
		printf("Nominada (1) Ganadora (2): ");
		scanf("%d", &estado);
		while (getchar() != '\n')
			;
	}

	if (estado == 1)
	{
		sprintf(query, "INSERT INTO Nominaciones (id_Pelicula, id_Premio, Estado) VALUES ('%d', '%d', '%s')", pelicula, premio, "Nominada");
	}
	else
	{
		sprintf(query, "INSERT INTO Nominaciones (id_Pelicula, id_Premio, Estado) VALUES ('%d', '%d', '%s')", pelicula, premio, "Ganadora");
	}

	mysql_execute_query(conn, query);
}

void agregar_persona_participacion_pelicula(MYSQL *conn)
{
	int pelicula;
	int persona;
	int rol;
	char query[1000];

	imprimir_roles(conn);
	printf("Ingrese el rol:");
	scanf("%d", &rol);
	while (getchar() != '\n')
		;

	imprimir_personas(conn);
	printf("Ingrese persona:");
	scanf("%d", &persona);
	while (getchar() != '\n')
		;

	imprimir_peliculas_titulo_original(conn);
	printf("Ingrese pelicula:");
	scanf("%d", &pelicula);
	while (getchar() != '\n')
		;

	sprintf(query, "INSERT INTO Participacion (id_Pelicula, id_Persona, id_Rol) VALUES ('%d', '%d', '%d');", pelicula, persona, rol);
	
	mysql_execute_query(conn, query);
}

void agregar_genero_pelicula(MYSQL *conn)
{
	int genero;
	int pelicula;
	char query[1000];

	imprimir_peliculas_titulo_original(conn);
	printf("Ingrese la pelicula:");
	scanf("%d", &pelicula);
	while (getchar() != '\n')
		;

	imprimir_generos(conn);
	printf("Ingrese el genero:");
	scanf("%d", &genero);
	while (getchar() != '\n')
		;

	sprintf(query, "INSERT INTO GenerosPorPelicula (id_Pelicula, id_Genero) VALUES ('%d', '%d');", pelicula, genero);
	mysql_execute_query(conn, query);
}

void agregar_personaje(MYSQL* conn){
	int persona;
	int tipo;
	char personaje[26];
	char query[1000];

	imprimir_participacion_peliculaTitulo_personaNombre(conn);
	printf("Elija la persona y en  pelicula participa:");
	scanf("%d", &persona);
	while(getchar() != '\n');

	imprimir_tipos(conn);
	printf("Elija el tipo del personaje:");
	scanf("%d", &tipo);
	while(getchar() != '\n');

	printf("Escriba nombre del personaje:");
	scanf("%[^\n]", personaje);
	while(getchar() != '\n');

	sprintf(query, "INSERT INTO ActoresPersonajes (id_Participacion, personaje, id_Tipo) VALUES ('%d', '%s', '%d')", persona, personaje, tipo);
	mysql_execute_query(conn, query);
}
