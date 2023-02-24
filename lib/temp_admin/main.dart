import 'package:ecommerce_cloth/firebase_options.dart';
import 'package:ecommerce_cloth/temp_admin/add_new_product.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(MaterialApp(
    home: AddNewProduct(),
  ));
}