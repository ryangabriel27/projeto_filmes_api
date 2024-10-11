class Filme {
  // Atributos
  final String? id; // Permite que o id seja nulo
  final String nome;
  final String categoria;
  final int duracao;
  final int ano;
  final int classificacao;

  // Construtor
  Filme(
      {this.id, // Id não obrigatório
      required this.nome,
      required this.categoria,
      required this.duracao,
      required this.ano,
      required this.classificacao});

  // Fábrica (factory) para criar uma instância de Filme a partir de um JSON
  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
      id: json['id'], // Converte o valor do campo 'id' do JSON para o atributo 'id'
      nome: json['nome'], // Converte o valor do campo 'nome' do JSON para o atributo 'nome'
      categoria: json['categoria'], // Converte o valor do campo 'categoria' do JSON para o atributo 'categoria'
      duracao: json['duracao'], // Converte o valor do campo 'duracao' do JSON para o atributo 'duracao'
      ano: json['ano'], // Converte o valor do campo 'ano' do JSON para o atributo 'ano'
      classificacao: json['classificacao'],// Converte o valor do campo 'classificacao' do JSON para o atributo 'classificacao'
    );
  }

  // Método para converter uma instância de Filme em um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'nome': nome, // Converte o atributo 'nome' para o campo 'nome' do JSON
      'categoria': categoria, // Converte o atributo 'categoria' para o campo 'categoria' do JSON
      'duracao': duracao, // Converte o atributo 'duracao' para o campo 'duracao' do JSON
      'ano': ano, // Converte o atributo 'ano' para o campo 'ano' do JSON
      'classificacao': classificacao, // Converte o atributo 'classificacao' para o campo 'classificacao' do JSON
    };
  }
}
