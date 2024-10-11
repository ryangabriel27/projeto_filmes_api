import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_filmes_api/Controller/filme_controller.dart';
import 'package:projeto_filmes_api/View/filme_details_screen.dart';
import 'package:projeto_filmes_api/View/filme_edit_screen.dart';

class FilmeScreen extends StatefulWidget {
  const FilmeScreen({super.key});

  @override
  State<FilmeScreen> createState() => _FilmeScreenState();
}

class _FilmeScreenState extends State<FilmeScreen> {
  // Controlador responsável por gerenciar os filmes
  final FilmeController _controller = FilmeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Define o título e os ícones da barra superior
        title: Text("Meus Filmes"),
        leading: Icon(Icons.movie), // Ícone de filme
        backgroundColor: Color.fromARGB(255, 110, 15, 15), // Cor de fundo do AppBar
        foregroundColor: Color.fromARGB(255, 226, 222, 222), // Cor do texto e ícones no AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0), // Espaçamento ao redor da tela
        child: Column(
          children: [
            // Botão para adicionar um novo filme
            ListTile(
              title: Text("Adicionar um novo filme"),
              leading: Icon(Icons.add), // Ícone de adicionar
              onTap: () {
                // Navega para a tela de cadastro de filmes
                Navigator.pushNamed(context, '/cadastro');
              },
            ),
            Expanded(
              // Usado para expandir a lista de filmes para preencher o espaço disponível
              child: FutureBuilder(
                future: _controller.getFromFilmeFromService(),
                builder: (context, snapshot) {
                  // Se a lista de filmes estiver vazia, exibe um indicador de progresso
                  if (_controller.listFilmes.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    // Se houver filmes, exibe uma lista deles
                    return Center(
                      child: ListView.builder(
                        itemCount: _controller.listFilmes.length, // Quantidade de filmes na lista
                        itemBuilder: (context, index) {
                          // Exibe informações básicas de cada filme
                          return ListTile(
                            title: Text(
                              _controller.listFilmes[index].nome +
                                  " - (${_controller.listFilmes[index].ano})",
                            ),
                            subtitle: Text(
                              "${_controller.listFilmes[index].categoria} | ${_controller.listFilmes[index].duracao} min",
                            ),
                            // Ícone de lixeira para excluir o filme
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                // Remove o filme do servidor e da lista
                                await _controller.deleteFilme(
                                    _controller.listFilmes[index].id!);
                                _controller.listFilmes.removeAt(index);
                                setState(() {}); // Atualiza a interface após a exclusão
                              },
                            ),
                            onTap: () {
                              // Ao clicar no filme, navega para a tela de detalhes
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FilmeDetailsScreen(
                                    filme: _controller.listFilmes[index],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
