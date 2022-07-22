import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/screens/widgets/no_internet.dart';

class ConnectionStatusListener
{
  static final ConnectionStatusListener _instance = ConnectionStatusListener._internal();
  ConnectionStatusListener._internal();
  static ConnectionStatusListener getInstance() => _instance;
  bool hasConnection = true;
  final StreamController _streamController = StreamController.broadcast();
  Stream get connectionChange => _streamController.stream;
  final Connectivity _connectivity = Connectivity();

  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
  }
  void dispose() {
    _streamController.close();
  }

  void _connectionChange(ConnectivityResult event) {
    checkConnection(event: event);
  }

  Future<bool> checkConnection({ConnectivityResult? event}) async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    if (event != null && event == ConnectivityResult.none) {
      hasConnection = false;
    }

    if (previousConnection != hasConnection) {
      _streamController.add(hasConnection);

      var ctx = Get.context as BuildContext;
      if (!hasConnection) {
        await Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => const ConnectionEmptyState()));
      } else {
        Navigator.of(ctx).pop();
      }
    }
    print('Connection(listener): $hasConnection');
    return hasConnection;
  }
}