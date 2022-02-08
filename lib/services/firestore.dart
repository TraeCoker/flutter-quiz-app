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
 
 //Retrieves a single quiz document
 Future<Quiz> getQuiz(String quizId) async {
   var ref = _db.collection('quizzes').doc(quizId);
   var snapshot = await ref.get();
   return Quiz.fromJson(snapshot.data() ?? {});
 }

 //Listens to current user's report document in Firestore
 //pattern is useful for listening to a realtime stream that depends on the 
 //user's UID
 Stream<Report> streamReport() {
   return AuthService().userStream.switchMap((user) { 
     if (user != null) {
       var ref = _db.collection('reports').doc(user.uid);
       return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
     } else {
       //return default report if no user
       return Stream.fromIterable([Report()]);
     }
   });
 }

 Future<void> updateUserReport(Quiz quiz) {
   var user = AuthService().user!;
   var ref = _db.collection('reports').doc(user.uid);

   //firestore expects map with strings as keys and dynamic types as values
   var data = {
     //increment total by 1 or set to 1 if 0
     'total': FieldValue.increment(1),
     'topics': {
       //merge quiz value into a Firestore list
       quiz.topic: FieldValue.arrayUnion([quiz.id])
     }
   };

  //merge: true makes it a non-destructive write
   return ref.set(data, SetOptions(merge: true));
 }
}