import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newnoticias/models/articulo.model.dart';

class ArticuloProvider{
  Future<List<ArticuloModel>> obtenerArticulo() async { 
    List<ArticuloModel> articulos=[];
    var client =http.Client();
    try{
      Map<String, String> parametros={
      'q':'tesla',
      'from':'2022-08-17',
      'sortBy':'publishedAt',
      'apiKey':'12958ea3d7ed479c87db050ef145ef19'
      };
    // ignore: unused_local_variable
    var response = await client.get(Uri.https('newsapi.org', 'v2/everything', parametros));
    var decodedResponse =
      jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    decodedResponse['articles'].forEach((item) => articulos.add(ArticuloModel.fromJson(item))) ;

    print(response.body);
    
    return articulos;
    }finally{ client.close(); }
  }
}
