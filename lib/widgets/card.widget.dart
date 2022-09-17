import 'package:flutter/material.dart';
import 'package:newnoticias/models/articulo.model.dart';
import 'package:newnoticias/pages/detalle.pages.dart';

class cardWidget extends StatelessWidget {
   cardWidget({super.key, required this.articulo});

  ArticuloModel articulo;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=> DetallePage(articulo:articulo,)));
      },
      
      child: Container( 
        color: Colors.amberAccent,
        height: 100,
        child: Column(           
            children: [
              Text(articulo.author),
              Text(articulo.content),
              Text(articulo.description),
            ]
          ),
      ),)
      );
  }
}
