import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'text_composer.dart'; // Certifique-se de que o arquivo está na mesma pasta

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Corrigido

  late User _currentUser;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        _currentUser = user!;
      });
    });
  }

  Future<User?> _getUser() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final User user = authResult.user!;
        return user;
      }
    } catch (error) {
      return null;
    }

    return null;
  }

  void _sendMessage({String? text, File? imgFile}) async {
    final User? user = await _getUser();

    Map<String, dynamic> data = {};

    // Adicione um carimbo de data/hora à mensagem
    data['timestamp'] = FieldValue.serverTimestamp();

    if (imgFile != null) {
      final storage = FirebaseStorage.instance;
      final ref =
          storage.ref().child(DateTime.now().millisecondsSinceEpoch.toString());

      UploadTask task = ref.putFile(imgFile);
      TaskSnapshot taskSnapshot = await task;

      String url = await taskSnapshot.ref.getDownloadURL();
      data['imgUrl'] = url;
    }

    if (text != null) data['text'] = text;

    FirebaseFirestore.instance.collection('messages').add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<QueryDocumentSnapshot> documents =
                    snapshot.data!.docs.reversed.toList();

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(documents[index]['text']),
                    );
                  },
                );
              },
            ),
          ),
          TextComposer(_sendMessage),
        ],
      ),
    );
  }
}
