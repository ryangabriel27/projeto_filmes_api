import 'package:flutter/material.dart';
import 'package:projeto_filmes_api/View/cadastro_screen.dart'; // Importa a tela de cadastro
import 'package:projeto_filmes_api/View/filme_screen.dart'; // Importa a tela principal de filmes

void main() {
  runApp(MyApp()); // Inicializa o aplicativo chamando a classe MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto jSon Web", // Define o título do aplicativo
      home: FilmeScreen(), // Define a tela inicial como FilmeScreen
      debugShowCheckedModeBanner: false, // Remove o banner de debug
      routes: {
        '/home': (context) => FilmeScreen(), // Rota para a tela de filmes
        '/cadastro': (context) => CadastroScreen() // Rota para a tela de cadastro
      },
    );
  }
}
