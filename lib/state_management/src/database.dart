import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class Counter {
  Counter({this.id, this.value});
  int id;
  int value;
}

abstract class CounterDatabase {
  Future<void> createCounter();
  Future<void> setCounter(Counter counter);
  Future<void> deleteCounter(Counter counter);
  Stream<List<Counter>> countersStream();
}

class AppFirestore implements CounterDatabase {

  @override
  Future<void> createCounter() async {
    int now = DateTime.now().millisecondsSinceEpoch;
    Counter counter = Counter(id: now, value: 0);
    await setCounter(counter);
  }

  @override
  Future<void> setCounter(Counter counter) async {
    _documentReference(counter).setData({
      'value': counter.value,
    });
  }

  @override
  Future<void> deleteCounter(Counter counter) async {
    _documentReference(counter).delete();
  }

  @override
  Stream<List<Counter>> countersStream() {
    return _FirestoreStream<List<Counter>>(
      apiPath: rootPath,
      parser: FirestoreCounterParser(),
    ).stream;
  }

  DocumentReference _documentReference(Counter counter) {
    return Firestore.instance.collection(rootPath).document('${counter.id}');
  }

  static final String rootPath = 'counters';

}

abstract class FirestoreNodeParser<T> {
  T parse(QuerySnapshot querySnapshot);
}

class FirestoreCounterParser extends FirestoreNodeParser<List<Counter>> {
  List<Counter> parse(QuerySnapshot querySnapshot) {
    var counters = querySnapshot.documents.map((documentSnapshot) {
      return Counter(
        id: int.parse(documentSnapshot.documentID),
        value: documentSnapshot['value'],
      );
    }).toList();
    counters.sort((lhs, rhs) => rhs.value.compareTo(lhs.value));
    return counters;
  }
} 

class _FirestoreStream<T> {
  _FirestoreStream({String apiPath, FirestoreNodeParser<T> parser}) {
    CollectionReference collectionReference = Firestore.instance.collection(apiPath);
    Stream<QuerySnapshot> snapshots = collectionReference.snapshots();
    stream = snapshots.map((snapshot) => parser.parse(snapshot));
  }

  Stream<T> stream;
}