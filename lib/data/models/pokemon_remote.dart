class PokemonListItemRemote {
  final String name;
  final String url;

  const PokemonListItemRemote({
    required this.name,
    required this.url
  });

  static PokemonListItemRemote fromJson(Map<String, dynamic> json){
      return PokemonListItemRemote(name: json["name"], url: json["url"]);
  }
}