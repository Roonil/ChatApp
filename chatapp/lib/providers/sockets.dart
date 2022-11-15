import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../strings/server_host.dart';

class MessagesSocket extends ChangeNotifier {
  io.Socket socket = io.io(
      socketHost,
      io.OptionBuilder()
          .disableForceNewConnection()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build());

  void connect() {
    socket.connect();
  }

  @override
  notifyListeners();
}
