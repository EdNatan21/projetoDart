class Video {
  String id;
  String titulo;
  String imagem;
  String descricao;
  String canal;

  Video({
    required this.id, required this.titulo,
    required this.imagem, required this.descricao,
    required this.canal
  });

  /*
  static converterJson(Map<String, dynamic> json) {
    return Video(
        id: json['id']['videoId'],
        titulo: json['snippet']['title'],
        //descricao: json[],
        imagem: json['snippet']['thumbnails']['high']['url'],
        canal: json['snippet']['channelId']
    );
  }
  */

  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
    id: json['id']['videoId'],
    titulo: json['snippet']['title'],
    imagem: json['snippet']['thumbnails']['high']['url'],
    descricao: json['snippet']['description'],
    canal: json['snippet']['channelTitle'],
    );
  }
}