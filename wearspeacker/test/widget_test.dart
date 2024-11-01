// widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seuprojeto/main.dart'; // Substitua pelo caminho correto do seu projeto

void main() {
  testWidgets('Verifica se o App carrega a HomeScreen corretamente', (WidgetTester tester) async {
    // Carrega o widget principal
    await tester.pumpWidget(MyApp());

    // Verifica se o texto inicial sobre a verificação de áudio é exibido
    expect(find.text('Checando dispositivos de áudio...'), findsOneWidget);
  });

  testWidgets('Verifica se o botão de Bluetooth é exibido e funcional', (WidgetTester tester) async {
    // Carrega o widget principal
    await tester.pumpWidget(MyApp());

    // Verifica se o botão "Abrir Configurações de Bluetooth" está na tela
    expect(find.text('Abrir Configurações de Bluetooth'), findsOneWidget);

    // Simula um toque no botão de configurações de Bluetooth
    await tester.tap(find.text('Abrir Configurações de Bluetooth'));
    await tester.pump();

    // Nota: Não podemos verificar a navegação para as configurações de Bluetooth diretamente aqui,
    // mas este teste garante que o botão está na interface e pode ser clicado.
  });
}
