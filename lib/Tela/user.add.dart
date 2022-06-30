import 'package:flutter/material.dart';
import 'package:project_firebase/Modelo/user.modelo.dart';
import 'package:project_firebase/Repositorio/user.repo.dart';

class AddUserPagina  extends StatelessWidget {
  const AddUserPagina ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrnome = TextEditingController();
    final ctridade = TextEditingController();
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
            SizedBox(height: 20,),
              TextField(
                controller: ctrnome,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40) ))
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: ctridade,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    labelText: 'Idade',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40) ))
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed:(){
                    final user = usuario (nome: ctrnome.text, idade: int.parse(ctridade.text));
                    addUser(user);
                    ctridade.text = '';
                    ctrnome.text = '';
                  },
                 child: Container(width: double.infinity,child: Icon(Icons.add,size: 32,),)),
            ],
          ),
        ),
      ),
    );
  }
}
