import 'package:order/features/event/domain/entities/event_entities.dart';
import 'package:order/features/login/domain/entities/account_entites.dart';

abstract class TicketReporisatory {
  Future<List<EventEntity>> remoteGetAllTickets();
  Future<List<String?>> remoteGetAllComment();
  Future<BaseResponse> remoteAddComment(EventEntity eventEntity);
  Future<BaseResponse> remoteAddTicket(EventEntity eventEntity);
  Future<BaseResponse> remoteUpdateTicket(EventEntity eventEntity);
  Future<BaseResponse> remoteDeleteTicket();
  Future<Account> remoteUploadMessage(String idUser, String message);
  //last
  Future<void> addMessage(MessageEntity chatMessages);
  Stream<List<MessageEntity>> getMessages();
}
