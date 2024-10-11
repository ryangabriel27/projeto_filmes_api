import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_filmes_api/Controller/filme_controller.dart';
import '../Model/filme.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final FilmeController _controller = FilmeController();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _duracaoController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _classificacaoController =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _controller.getFromFilmeFromService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome do filme',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira o nome do filme';
                      } else {
                        return null;
                      }
                    },
                    controller: _nomeController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Categoria do filme',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira a categoria do filme';
                      } else {
                        return null;
                      }
                    },
                    controller: _categoriaController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Duração',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira a duração do filme em minutos';
                      } else {
                        return null;
                      }
                    },
                    controller: _duracaoController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ano',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira o ano de lançamento do filme';
                      } else {
                        return null;
                      }
                    },
                    controller: _anoController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nota',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira a sua classificação de 0 a 10 do filme';
                      } else {
                        return null;
                      }
                    },
                    controller: _classificacaoController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _cadastrarFilme();
                      }
                    },
                    child: Text("Cadastrar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Filme getFilmes() {
    return Filme(
      nome: _nomeController.text,
      categoria: _categoriaController.text,
      duracao: int.parse(_duracaoController.text),
      ano: int.parse(_anoController.text),
      classificacao: int.parse(_classificacaoController.text),
    );
  }

  void limpar() {
    _nomeController.clear();
    _categoriaController.clear();
    _duracaoController.clear();
    _anoController.clear();
    _classificacaoController.clear();
    setState(() {});
  }

  void _cadastrarFilme() {
    // Método para cadastrar filme no jSon!

    bool verificaFilme = false;

    for (int i = 0; i < _controller.listFilmes.length; i++) {
      if (_nomeController.text.trim().toLowerCase() ==
          _controller.listFilmes[i].nome.trim().toLowerCase()) {
        verificaFilme = true;
        break;
      }
    }

    if (!verificaFilme) {
      _controller.addFilme(getFilmes());
      // SnackBar cadastrado com sucesso!
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Filme cadastrado com sucesso!'),
          duration: Duration(seconds: 2),
        ),
      );
      limpar();
      setState(() {
        Navigator.pushNamed(context, '/home');
      });
    } else {
      // SnackBar já cadastrado!
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Filme já cadastrado!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}