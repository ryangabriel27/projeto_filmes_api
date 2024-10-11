import 'package:projeto_filmes_api/Model/filme.dart';
import 'package:projeto_filmes_api/Service/filme_service.dart';

class FilmeController {
  List<Filme> listFilmes = [];
  final FilmeService _service = FilmeService();

  Future<void> getFromFilmeFromService() async {
    try {
      listFilmes.clear();
      listFilmes = await _service.getFilmes();
      print('List filmes: $listFilmes'); // Log para ver a lista de filmes
    } catch (e) {
      print(e); // Log para ver o erro
    }
  }

  Future<void> addFilme(Filme filme) async {
    try {
      Filme newFilme = await _service.postFilme(filme);
      listFilmes.add(newFilme);
      print('Filme adicionado: $newFilme');
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteFilme(String id) async {
    try {
      await _service.deleteFilme(id); // Faz o método DELETE para a url
      listFilmes.removeWhere((filme) => filme.id == id); // Remove da lista
      print('Filme excluido: $id');
    } catch (e) {
      print(e);
    }
  }

  // EditFilme
  Future<void> editFilme(Filme filme) async {
    try {
      await _service.putFilme(filme); // Faz o método PUT para a url
      listFilmes
          .removeWhere((filme) => filme.id == filme.id); // Remove da lista
      listFilmes.add(filme);
      print('Filme editado: $filme');
    } catch (e) {
      print(e);
    }
  }
}