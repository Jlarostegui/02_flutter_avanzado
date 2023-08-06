import 'dart:io';

void main() async {
  final servidor = await ServerSocket.bind(InternetAddress.anyIPv4, 3000);
  servidor.listen((cliente) {
    recibirNuevaConexion(cliente: cliente);
  });
}

void recibirNuevaConexion({required Socket cliente}) {
  try {
    print(
        'Nueva conexión desde : ${cliente.remoteAddress.address} : ${cliente.port}');

    cliente.listen(
      (data) {
        
      },
      onError: (error) {
        print(error.toString());
        cliente.close();
      },
      onDone: () {
        print('Cliente desconectado');
        cliente.close();
      },
    );
  } catch (e) {
    throw UnimplementedError();
  }
}
