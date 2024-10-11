import 'package:flutter/material.dart';
import 'package:projeto_filmes_api/Model/filme.dart';

class FilmeEditScreen extends StatefulWidget {
  Filme filme;
  FilmeEditScreen({super.key, required this.filme});

  @override
  State<FilmeEditScreen> createState() => _FilmeEditScreenState();
}

class _FilmeEditScreenState extends State<FilmeEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Filme"),
      ),
      body: Padding(padding: EdgeInsets.all(10.0),
      child: Center(
        child: Text("adas")
      ),),
    );
  }
}