import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const platform = MethodChannel('com.seuprojeto/audio');

  String _audioStatus = "Checando dispositivos de áudio...";

  @override
  void initState() {
    super.initState();
    _checkAudioOutput();
  }

  Future<void> _checkAudioOutput() async {
    try {
      final bool speakerAvailable = await platform.invokeMethod('isSpeakerAvailable');
      final bool bluetoothConnected = await platform.invokeMethod('isBluetoothConnected');
      setState(() {
        _audioStatus = "Alto-falante: ${speakerAvailable ? "Disponível" : "Indisponível"}\n"
                       "Bluetooth: ${bluetoothConnected ? "Conectado" : "Desconectado"}";
      });
    } on PlatformException catch (e) {
      setState(() {
        _audioStatus = "Falha ao checar dispositivos de áudio: ${e.message}";
      });
    }
  }

  Future<void> _openBluetoothSettings() async {
    try {
      await platform.invokeMethod('openBluetoothSettings');
    } on PlatformException catch (e) {
      print("Erro ao abrir as configurações de Bluetooth: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App de Acessibilidade - Wear OS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_audioStatus),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openBluetoothSettings,
              child: Text("Abrir Configurações de Bluetooth"),
            ),
          ],
        ),
      ),
    );
  }
}
