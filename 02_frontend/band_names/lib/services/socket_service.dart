import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus {
  online,
  offline,
  connecting,
}

class SocketService with ChangeNotifier {
  final Socket socket = io('http://192.168.1.157:3000',
      OptionBuilder().setTransports(['websocket']).build());

  ServerStatus _serverStatus = ServerStatus.connecting;
  ServerStatus get serverStatus => _serverStatus;
  set serverStatus(ServerStatus status) {
    _serverStatus = status;
    notifyListeners();
  }

  SocketService() {
    initConfig();
  }

  void initConfig() {
    socket.connect();

    print(socket.connected);

    socket.onConnecting((_) {
      serverStatus = ServerStatus.connecting;
      notifyListeners();
    });

    socket.onConnect((_) {
      serverStatus = ServerStatus.online;
      notifyListeners();
    });

    socket.onDisconnect((_) {
      serverStatus = ServerStatus.offline;
      notifyListeners();
    });
  }
}
