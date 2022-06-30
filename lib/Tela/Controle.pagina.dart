import 'package:flutter/material.dart';
import 'package:project_firebase/Tela/AlluserPagina.dart';
import 'package:project_firebase/Tela/user.add.dart';
import 'package:project_firebase/Tela/usuario.procurar.dart';
class Controlepagina extends StatelessWidget{
  const Controlepagina({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 return DefaultTabController(
     length:4,
     child: Scaffold(
       appBar: AppBar(
     title: Text('Gestão de Usuario'),
    bottom: TabBar(
    tabs: const [
      Tab(icon: Icon (Icons.supervised_user_circle_sharp,size:28,),text:'Adicionar',),
      Tab(icon: Icon (Icons.edit_attributes,size:28,),text:'Usuario',),
      Tab(icon: Icon (Icons.search,size:28,),text:'Procurar',),
      Tab(icon: Icon (Icons.history,size:28,),text:'Historico',),
     ],
    ),

 ),
       body: TabBarView(
         children: const [
           AddUserPagina(),
           AllUsers(),
           procurar(),
           Center (child: Text('Página 4'),),
         ],
       ),

 ));
  }
}

