import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:order/features/event/domain/entities/event_entities.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    required final String userId,
    required final String message,
    required final String senderName,
    required final String receiverName,
  }) : super(userId, message, senderName, receiverName);

// i am using this
  factory MessageModel.fromjson(Map<String, dynamic> json) {
    return MessageModel(
      userId: json['userId'],
      message: json['message'],
      senderName: json['senderName'],
      receiverName: json['receiverName'],
    );
  }

  factory MessageModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    return MessageModel(
      userId: documentSnapshot.data()!['userId'],
      message: documentSnapshot.data()!['message'],
      senderName: documentSnapshot.data()!['senderName'],
      receiverName: documentSnapshot.data()!['receiverName'],
    );
  }

  Map<String, dynamic> toDocument() => {
        'idUser': userId,
        'message': message,
        'senderName': senderName,
        'receiverName': receiverName,
      };
// end
  // factory MessageModel.fromjson1(MessageEntity messageEntity) => MessageModel(
  //       userId: messageEntity.userId,
  //       message: messageEntity.message,
  //     );

  Map<String, dynamic> toJson() => {
        'idUser': userId,
        'message': message,
      };
}
