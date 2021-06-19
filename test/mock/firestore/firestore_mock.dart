import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// class MockTweetRepository extends Mock implements TweetRepository {}
@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  DocumentSnapshot,
])
void main() {}



// class MockFirestore extends Mock implements FirebaseFirestore {}

// class MockCollectionReference extends Mock implements CollectionReference {}

// class MockDocumentReference extends Mock implements DocumentReference {}

// class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}
