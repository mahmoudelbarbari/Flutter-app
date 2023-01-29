import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabseProvider {
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
}

class FirebaseDatasourceProvider {
  static final _firebaseDatasourceProvider =
      FirebaseDatasourceProvider._internal();

  factory FirebaseDatasourceProvider() {
    return _firebaseDatasourceProvider;
  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  FirebaseDatasourceProvider._internal();
}

// abstract class TicketDatasourceInterface extends FirebaseDatasourceProvider {
//   TicketDatasourceInterface() : super._internal();

//   Future<List<EventEntity>> remoteGetAllTickets();
//   Future<List<String?>> remoteGetAllComment();
//   Future<BaseResponse> remoteAddComment(EventModel eventModel);
//   Future<BaseResponse> remoteAddTicket(EventModel eventModel);
//   Future<BaseResponse> remoteUpdateTicket(EventModel eventModel);
//   Future<BaseResponse> remoteDeleteTicket();
//   Future<Account> uploadMessage(String idUser, String message);
//   //last
//   Future<void> addMessage(MessageEntity messageEntity);
//   Stream<List<MessageModel>> getMessages();
// }

// class RemoteTicketDatasource extends TicketDatasourceInterface {
//   RemoteTicketDatasource() : super();

//   @override
//   Future<void> addMessage(MessageEntity messageEntity) {
//     // TODO: implement addMessage

//     throw UnimplementedError();
//   }

//   @override
//   Stream<List<MessageModel>> getMessages() {
//     // TODO: implement getMessages
//     throw UnimplementedError();
//   }

//   @override
//   Future<BaseResponse> remoteAddComment(EventModel eventModel) {
//     // TODO: implement remoteAddComment
//     throw UnimplementedError();
//   }

//   @override
//   Future<BaseResponse> remoteAddTicket(EventModel eventModel) {
//     // TODO: implement remoteAddTicket
//     throw UnimplementedError();
//   }

//   @override
//   Future<BaseResponse> remoteDeleteTicket() {
//     // TODO: implement remoteDeleteTicket
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<String?>> remoteGetAllComment() {
//     // TODO: implement remoteGetAllComment
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<EventEntity>> remoteGetAllTickets() {
//     // TODO: implement remoteGetAllTickets
//     throw UnimplementedError();
//   }

//   @override
//   Future<BaseResponse> remoteUpdateTicket(EventModel eventModel) {
//     // TODO: implement remoteUpdateTicket
//     throw UnimplementedError();
//   }

//   @override
//   Future<Account> uploadMessage(String idUser, String message) {
//     // TODO: implement uploadMessage
//     throw UnimplementedError();
//   }
// }
