import 'package:flutter/material.dart';
import 'package:project_firebase/Repositorio/user.repo.dart';
import '/../Modelo/user.modelo.dart';

class ListUsers extends StatefulWidget {
  List<usuario> users;
  ListUsers({required this.users});
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    final allusers = widget.users;
    final _ctrupdatenome = TextEditingController();
    final _ctrupdateidade = TextEditingController();
    return  ListView.builder(
      itemCount: allusers.length,
      itemBuilder: (context,index){
        return Card(
          child: ListTile(
            leading:CircleAvatar(
              backgroundColor: Colors.pink,
              child: Text(allusers[index].nome.substring(0,2).toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
            ) ,
            title: Text(allusers[index].nome, style: TextStyle(fontSize: 22),),
            subtitle: Text(allusers[index].idade.toString()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: (){
                  _ctrupdatenome.text = allusers[index].nome;
                  _ctrupdateidade.text = allusers[index].idade.toString();
                  showDialog(context: context,
                      builder: (context)=>AlertDialog(
                        title: Text('Aualizar:${allusers[index].nome}'),
                        content: SingleChildScrollView(
                          child: Container(
                            height: 250,
                            child: Column(
                              children: [
                                TextField(
                                  style: TextStyle(fontSize: 22,color: Colors.pink),
                                    decoration: InputDecoration(labelText: 'nome',
                                        border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(40)))),
                                  controller: _ctrupdatenome,
                                ),
                                SizedBox(height: 20,),
                                TextField(
                                  style: TextStyle(fontSize: 22,color: Colors.pink),
                                  decoration: InputDecoration(labelText: 'idade',
                                      border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(40)))),
                                  controller: _ctrupdateidade,
                                ),
                                SizedBox(height: 20,),
                                ElevatedButton(
                                    onPressed:(){
                                      final user = usuario(id: allusers[index].id,
                                          nome: _ctrupdatenome.text,
                                          idade: int.parse(_ctrupdateidade.text));
                                          UpdateUser(user);
                                      },
                                    child: Container(width: double.infinity,
                                      child: Text('Atualizar'),))
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          ElevatedButton(onPressed:(){
                            Navigator.pop(context,'Anular');
                          }, child:Text('Anular'))
                        ],
                      )
                  );
                },
                child: Icon(Icons.edit,size: 32,color:Colors.pink,),


              ),
              TextButton(
                onPressed: (){
                  showDialog(context: context,
                      builder: (context)=>AlertDialog(
                        title: Text('Voulez-vous vraiment supprimer ${allusers[index].nome}?'),
                        actions: [
                        ElevatedButton(
                            onPressed:(){
                              deleteUser(allusers[index].id);
                              Navigator.pop(context,'oui');
                            },
                          child: Text('Oui'),
                        ),
                        ElevatedButton(
                            onPressed:(){
                              Navigator.pop(context,'Annuler');
                            },
                            child: Text('Non'),
                          ),



                        ],
                      ));
                },
                child: Icon(Icons.delete,size: 32,color:Colors.red,),

              ),
            ],
          ),
         ),
        );
      },
    );
  }
}
