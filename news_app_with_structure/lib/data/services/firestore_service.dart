// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
//
// class FireStoreService {
//   FireStoreService._();
//   static final instance = FireStoreService._();

//   Future<List<T>> collectionFuture<T>({
//     @required String path,
//     @required T builder(Map<String, dynamic> data, String documentID),
//     Query queryBuilder(Query query),
//     int sort(T lhs, T rhs),
//   }) async {
//     Query query = FirebaseFirestore.instance.collection(path);
//     if (queryBuilder != null) {
//       query = queryBuilder(query);
//     }
//     final QuerySnapshot snapshots = await query.get();
//     final result = snapshots.docs
//         .map((snapshot) => builder(snapshot.data(), snapshot.id))
//         .where((value) => value != null)
//         .toList();

//     if (sort != null) {
//       result.sort(sort);
//     }
//     return result;
//   }

//   // Used to apply query and get data from firestore.
//   Stream<List<T>> collectionStream<T>({
//     @required String path,
//     @required T builder(Map<String, dynamic> data, String documentID),
//     Query queryBuilder(Query query),
//     int sort(T lhs, T rhs),
//   }) {
//     Query query = FirebaseFirestore.instance.collection(path);
//     if (queryBuilder != null) {
//       query = queryBuilder(query);
//     }
//     final Stream<QuerySnapshot> snapshots = query.snapshots();
//     return snapshots.map((snapshot) {
//       final result = snapshot.docs
//           .map((snapshot) => builder(snapshot.data(), snapshot.id))
//           .where((value) => value != null)
//           .toList();
//       if (sort != null) {
//         result.sort(sort);
//       }
//       return result;
//     });
//   }

//   // Used to set data to firestore.
//   Future<void> setData(
//       {String path, Map<String, dynamic> data, bool withMerge = false}) async {
//     final documentReference = FirebaseFirestore.instance.doc(path);
//     print('$path : $data');
//     await documentReference.set(data, SetOptions(merge: withMerge));
//   }

//   // Used to set data to firestore.
//   Future<void> addData(
//       {String path, Map<String, dynamic> data, bool withMerge = false}) async {
//     //final documentReference = FirebaseFirestore.instance.doc(path);
//     // final documentReference = FirebaseFirestore.instance.collection(path).add(data);
//     print('$path : $data');
//     //await documentReference.set(data, SetOptions(merge: withMerge));
//   }

//   // Used to delete data from firestore.
//   Future<void> deleteData({String path}) async {
//     final documentReference = FirebaseFirestore.instance.doc(path);
//     print('Deleted path: $path');
//     await documentReference.delete();
//   }

//   // Used to get documens of dynamic type from firestore.
//   Stream<T> documentsStream<T>({
//     @required String path,
//     @required T builder(Map<String, dynamic> data, String docId),
//   }) {
//     final reference = FirebaseFirestore.instance.doc(path);
//     final snapshots = reference.snapshots();
//     return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
//   }

//   Future<T> documentsFuture<T>({
//     @required String path,
//     @required T builder(Map<String, dynamic> data, String docId),
//   }) async {
//     final reference = FirebaseFirestore.instance.doc(path);
//     final snapshots = reference.snapshots();
//     return await snapshots
//         .map((snapshot) => builder(snapshot.data(), snapshot.id))
//         .first;
//   }
// }
