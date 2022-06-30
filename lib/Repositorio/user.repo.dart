
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Modelo/user.modelo.dart';

Future addUser(usuario  user) async{
 final docUser = FirebaseFirestore.instance.collection('usuario').doc();
 user.id = docUser.id;
 await docUser.set(user.toJson());
}
//________________________________

Future UpdateUser(usuario  user) async{
 final docUser = FirebaseFirestore.instance.collection('usuario').doc(user.id);
 await docUser.update(user.toJson());
}
//________________________________
Future deleteUser(String id) async{
 final docUser = FirebaseFirestore.instance.collection('usuario').doc(id);
 await docUser.delete();
}