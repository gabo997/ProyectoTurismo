/*****************************************************************/
/****************** UNIVERSIDAD DE CARABOBO **********************/
/********* FACULTAD EXPERIMENTAL DE CIENCIAS Y TECNOLOGIA ********/
/*************** DEPARTAMENTO DE COMPUTACIÓN *********************/
/************* BASE DE DATOS - PROYECTO 1-2017 *******************/

/*********** SCRIPT DE ELIMINACIÓN DE LA BASE DE DATOS ***********/

/********** Gabriel López    *****/
/********** Gabriel Oliveira *****/
/********** Moisés Mendoza   *****/
/********** Jhon Coello      *****/


\c postgres

DROP DATABASE proyecto;

/*---------------------------------------------*/
/*--------- ELIMINACION DE USUARIOS -----------*/
/*---------------------------------------------*/

DROP USER etovar;
DROP USER jcohello;
DROP USER glopez;
DROP USER moisesm;
DROP USER goliveira;
DROP USER perezjuan; 

/*---------------------------------------------*/
/*--------- ELIMINACION DE ROLES --------------*/
/*---------------------------------------------*/

DROP ROLE admin;
DROP ROLE guest;


