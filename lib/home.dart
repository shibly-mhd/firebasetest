import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernamecltr = TextEditingController();
    final TextEditingController passwordcltr = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          TextFormField(controller: usernamecltr),
          TextFormField(controller: passwordcltr),
          ElevatedButton(
            onPressed: () async {
              final firestore = FirebaseFirestore.instance;

              try {
                await firestore.collection('userdatacollection').add({
                  'title': usernamecltr.text.trim().toString(),
                  'subtitle': passwordcltr.text.trim().toString(),
                });
              } on FirebaseException catch (e) {
                log(e.toString());
              }
            },
            child: const Text('save'),
          ),
        ],
      ),
    );
  }
}
