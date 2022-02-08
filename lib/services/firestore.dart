import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///Reads all the documents from the topics collection
  Future<List<Topic>> getTopics() async {
    var ref = _db.collection('topics');
    //get returns data once. Not listening in real time
    var snapshot = await ref.get();
    //snapshot returns extra attributes. Loop to get data
    var data = snapshot.docs.map((s) => s.data());
    //fromJson generated for us by Json Serializable 
    var topics = data.map((d) => Topic.fromJson(d));
    return topics.toList();
  }
 
}