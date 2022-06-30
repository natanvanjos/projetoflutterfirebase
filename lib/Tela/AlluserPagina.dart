import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_firebase/Modelo/user.modelo.dart';
import 'package:project_firebase/Tela/Widgets/usuarioList.dart';

class  AllUsers extends StatefulWidget {

  const AllUsers ({Key? key}) : super(key: key);

  @override

  _AllUsersState createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {

  @override

  Widget build(BuildContext context) {

    List<usuario > allusers=[];
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('usuario').orderBy('idade', descending: false).snapshots(),
        builder: (context,snp){
          if (snp.hasError){
            return Center(child: Text('Error'),);
          }
          if (snp.hasData){
            allusers = snp.data!.docs
                .map((doc) =>usuario .fromJson(doc.data()as Map<String,dynamic>)).toList();
            return ListUsers(users: allusers);
            
          } else {
            return  Center(child: CircularProgressIndicator());
          }
        }
    )
    );
  }
}


