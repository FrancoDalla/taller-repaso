/*
Escriba un programa que imprima en consola el factorial de todos los números 
entre 1 y 9.
*/

package CARO_ALONSO.practica_2;

public class tp2punto2 {

    public static void main(String[] args) {

        for (int i = 1; i <= 9; i++) {
            
            int numero_imprimir = i;
            int num=i;
            int factorial = 1;

            while (num != 0) {      //PODRIA USAR UN FOR
                factorial = factorial * num;
                num = num - 1;
            }
            System.out.println("el numero factorial de " + numero_imprimir + " es : " + factorial);
        }

    }
}