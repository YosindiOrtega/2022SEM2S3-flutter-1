import 'package:flutter/material.dart';
import 'package:newnoticias/models/articulo.model.dart';
import 'package:newnoticias/provides/articulos.provides.dart';
import 'package:newnoticias/widgets/card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ArticuloProvider articuloProvider =ArticuloProvider();
  late Future<List<ArticuloModel>> articulos;

@override
  void initState() {
     // ignore: unused_local_variable
    articulos = articuloProvider.obtenerArticulo();
    super.initState();    
  }
  String titulo='Noticias';

@override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: FutureBuilder(
        future: articulos,
        builder:((context, snapshot) {
          List<Widget> lista=[];
          if(snapshot.hasData){
           snapshot.data?.forEach((element)=>lista.add(cardWidget(articulo: element))); //
            return ListView(
            children: lista,
        ); 
          }else{
            return Center(child: CircularProgressIndicator());
          }
          
        }),
        ),
    );
  }
}
