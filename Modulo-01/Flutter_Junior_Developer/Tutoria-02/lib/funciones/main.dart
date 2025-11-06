import 'funciones.dart';

void main() {
  // Funcion anonima
  // Funciones Anonima
  // (parametros) {
  //  cuerpo de la funcion
  // };
  lista.forEach((intem) {
    print('Me gusta la $intem');
  });

  // Expresion Lambda
  // Sintaxis
  // (parametros) => expresions_a_retornar;
  //=> fat arrow
  var sumaLambda = (int a, int b) => a + b;
  print(sumaLambda(2, 3));
}
