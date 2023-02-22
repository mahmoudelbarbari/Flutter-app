// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:order/core/database/firebase_db.dart';
// import 'package:order/features/event/data/models/event_model.dart';
// import 'package:order/features/event/data/models/titcket_model.dart';
// import 'package:order/features/event/domain/entities/event_entities.dart';
// import 'package:order/features/login/domain/entities/account_entites.dart';

// abstract class RemoteTicketDatasource {
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

// class RemoteTicketDatasourceImpl implements RemoteTicketDatasource {
//   final globalChatChannelCollection =
//       FirebaseFirestore.instance.collection("globalChatChannel");

//   final FirebaseDatabseProvider firebaseDB;
//   RemoteTicketDatasourceImpl(
//     this.firebaseDB,
//   );
//   @override
//   Future<BaseResponse> remoteAddTicket(EventModel eventModel) async {
//     try {
//       await firebaseDB.firebaseFirestore.collection("Ticket").doc().set({
//         "id": FieldValue.increment(1),
//         "title": eventModel.title,
//         "description": eventModel.description,
//       });

//       return BaseResponse(status: true, message: "Ticket Added Successfully");
//     } catch (e) {
//       return BaseResponse(status: false, message: "Something went wrong");
//     }
//   }

//   @override
//   Future<BaseResponse> remoteDeleteTicket() async {
//     try {
//       await firebaseDB.firebaseFirestore.doc("Ticket").delete();
//       return BaseResponse(status: true, message: "Ticket Added Successfully");
//     } catch (e) {
//       return BaseResponse(status: false, message: "Something went wrong");
//     }
//   }

//   @override
//   Future<List<EventEntity>> remoteGetAllTickets() async {
//     final retrive = firebaseDB.firebaseFirestore.collection("Ticket");
//     final querySnapshot = await retrive.get();
//     querySnapshot.docs.map((doc) => doc.data()).toList();
//     List<EventModel> events = [];
//     for (QueryDocumentSnapshot<Map<String, dynamic>> doc
//         in querySnapshot.docs) {
//       events.add(EventModel.fromSnapShot(doc));
//     }
//     return events;
//   }

//   @override
//   Future<List<String?>> remoteGetAllComment() async {
//     final retrive = firebaseDB.firebaseFirestore.collection("Comment");
//     QuerySnapshot<Map<String, dynamic>> querySnapshot = await retrive.get();
//     querySnapshot.docs.map((doc) => doc.data()).toList();
//     List<EventModel> comments = [];
//     for (var doc in querySnapshot.docs) {
//       comments.add(EventModel.fromSnapShot2(doc));
//     }
//     return comments.map((val) => val.comment).toList();

//     // // firebaseDB.firebaseFirestore.collection("Ticket").doc(comment).get();
//     // final retrive =
//     //      firebaseDB.firebaseFirestore.collection("Ticket").doc("Ticket").get();
//     // List<String> comments = await retrive['']
//     // // for (var doc in retrive) {
//     // //   comments.add(EventModel.fromSnapShot(doc));
//     // // }
//     // return comments;
//   }

//   @override
//   Future<BaseResponse> remoteUpdateTicket(EventModel eventModel) async {
//     try {
//       await firebaseDB.firebaseFirestore.doc("Ticket").update({
//         "title": eventModel.title,
//         "description": eventModel.description,
//       });
//     } catch (e) {
//       return BaseResponse(status: false, message: e.toString());
//     }
//     return BaseResponse(status: false, message: "Something went wrong!");
//   }

//   @override
//   Future<BaseResponse> remoteAddComment(EventModel eventModel) async {
//     try {
//       await firebaseDB.firebaseFirestore.collection("Comment").doc().set({
//         "comment": eventModel.comment,
//       });

//       return BaseResponse(status: true, message: "Comment Added Successfully");
//     } catch (e) {
//       return BaseResponse(status: false, message: "Something went wrong");
//     }
//   }

//   @override
//   Future<Account> uploadMessage(String idUser, String message) async {
//     throw UnimplementedError();
//     // try {
//     //   final refMessage =
//     //       firebaseDB.firebaseFirestore.collection('chats/$idUser');

//     //   final newMessages = MessageModel(idUser: idUser, message: message);
//     //   await refMessage.add(newMessages.toJson());

//     //   return Account(idUser: idUser, replyCode: 200, message: 'Successe');
//     // } catch (e) {
//     //   return Account(idUser: idUser, replyCode: 500, message: 'Server Error');
//     // }
//   }

//   @override
//   Future<void> addMessage(MessageEntity messageEntity) async {
//     final newMessage = MessageModel(
//       userId: messageEntity.userId,
//       message: messageEntity.message,
//       senderName: messageEntity.senderName,
//       receiverName: messageEntity.receiverName,
//     );
//     await globalChatChannelCollection
//         .doc()
//         .collection("messages")
//         .add(newMessage.toDocument());
//   }

//   @override
//   Stream<List<MessageModel>> getMessages() {
//     return globalChatChannelCollection
//         .doc()
//         .collection("messages")
//         .orderBy("time")
//         .snapshots()
//         .map((querySnapshot) => querySnapshot.docs
//             .map((docSnapshot) => MessageModel.fromSnapshot(docSnapshot))
//             .toList());
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:order/features/event/data/models/event_model.dart';
import 'package:order/features/event/data/models/titcket_model.dart';
import 'package:order/features/event/domain/entities/event_entities.dart';
import 'package:order/features/login/domain/entities/account_entites.dart';

class FirebaseDatasourceProvider {
  static final _firebaseDatasourceProvider =
      FirebaseDatasourceProvider._internal();

  factory FirebaseDatasourceProvider() {
    return _firebaseDatasourceProvider;
  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  FirebaseDatasourceProvider._internal();
}

abstract class TicketDatasourceInterface extends FirebaseDatasourceProvider {
  TicketDatasourceInterface() : super._internal();

  Future<List<EventEntity>> remoteGetAllTickets();
  Future<List<String?>> remoteGetAllComment();
  Future<BaseResponse> remoteAddComment(EventModel eventModel);
  Future<BaseResponse> remoteAddTicket(EventModel eventModel);
  Future<BaseResponse> remoteUpdateTicket(EventModel eventModel);
  Future<BaseResponse> remoteDeleteTicket();
  Future<Account> uploadMessage(String idUser, String message);
  //last
  Future<void> addMessage(MessageEntity messageEntity);
  Stream<List<MessageModel>> getMessages();
}

class RemoteTicketDatasource extends TicketDatasourceInterface {
  RemoteTicketDatasource() : super();

  @override
  Future<BaseResponse> remoteAddTicket(EventModel eventModel) async {
    try {
      await firebaseFirestore.collection("Ticket").doc().set({
        "id": FieldValue.increment(1),
        "title": eventModel.title,
        "description": eventModel.description,
      });

      return BaseResponse(status: true, message: "Ticket Added Successfully");
    } catch (e) {
      return BaseResponse(status: false, message: "Something went wrong");
    }
  }

  @override
  Future<BaseResponse> remoteDeleteTicket() async {
    try {
      await firebaseFirestore.doc("Ticket").delete();
      return BaseResponse(status: true, message: "Ticket Added Successfully");
    } catch (e) {
      return BaseResponse(status: false, message: "Something went wrong");
    }
  }

  @override
  Future<List<EventEntity>> remoteGetAllTickets() async {
    final retrive = firebaseFirestore.collection("Ticket");
    final querySnapshot = await retrive.get();
    querySnapshot.docs.map((doc) => doc.data()).toList();
    List<EventModel> events = [];
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc
        in querySnapshot.docs) {
      events.add(EventModel.fromSnapShot(doc));
    }
    return events;
  }

  @override
  Future<List<String?>> remoteGetAllComment() async {
    final retrive = firebaseFirestore.collection("Comment");
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await retrive.get();
    querySnapshot.docs.map((doc) => doc.data()).toList();
    List<EventModel> comments = [];
    for (var doc in querySnapshot.docs) {
      comments.add(EventModel.fromSnapShot2(doc));
    }
    return comments.map((val) => val.comment).toList();
  }

  @override
  Future<BaseResponse> remoteUpdateTicket(EventModel eventModel) async {
    try {
      await firebaseFirestore.doc("Ticket").update({
        "title": eventModel.title,
        "description": eventModel.description,
      });
    } catch (e) {
      return BaseResponse(status: false, message: e.toString());
    }
    return BaseResponse(status: false, message: "Something went wrong!");
  }

  @override
  Future<BaseResponse> remoteAddComment(EventModel eventModel) async {
    try {
      await firebaseFirestore.collection("Comment").doc().set({
        "comment": eventModel.comment,
      });

      return BaseResponse(status: true, message: "Comment Added Successfully");
    } catch (e) {
      return BaseResponse(status: false, message: "Something went wrong");
    }
  }

  @override
  Future<Account> uploadMessage(String idUser, String message) async {
    throw UnimplementedError();
    // try {
    //   final refMessage =
    //       firebaseDB.firebaseFirestore.collection('chats/$idUser');

    //   final newMessages = MessageModel(idUser: idUser, message: message);
    //   await refMessage.add(newMessages.toJson());

    //   return Account(idUser: idUser, replyCode: 200, message: 'Successe');
    // } catch (e) {
    //   return Account(idUser: idUser, replyCode: 500, message: 'Server Error');
    // }
  }

  @override
  Future<void> addMessage(MessageEntity messageEntity) async {
    final newMessage = MessageModel(
      userId: messageEntity.userId,
      message: messageEntity.message,
      senderName: messageEntity.senderName,
      receiverName: messageEntity.receiverName,
    );
    await firebaseFirestore
        .collection("messages")
        .doc()
        .set(newMessage.toDocument());
  }

  @override
  Stream<List<MessageModel>> getMessages() {
    return firebaseFirestore
        .collection("messages")
        .orderBy("time")
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((docSnapshot) => MessageModel.fromSnapshot(docSnapshot))
            .toList());
  }
}
