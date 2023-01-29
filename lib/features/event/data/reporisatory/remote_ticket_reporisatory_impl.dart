import 'package:order/features/event/data/datasource/remote_ticket_datasource.dart';
import 'package:order/features/event/data/models/event_model.dart';
import 'package:order/features/event/domain/entities/event_entities.dart';
import 'package:order/features/event/domain/reporisatory/ticket_reporisatory.dart';
import 'package:order/features/login/domain/entities/account_entites.dart';

class TicketReporisatoryImlp implements TicketReporisatory {
  final TicketDatasourceInterface remoteTicketDatasource;
  TicketReporisatoryImlp(
    this.remoteTicketDatasource,
  );

  @override
  Future<BaseResponse> remoteAddTicket(EventEntity eventEntity) async {
    return await remoteTicketDatasource
        .remoteAddTicket(EventModel.fromEntity(eventEntity));
  }

  @override
  Future<BaseResponse> remoteDeleteTicket() async {
    return await remoteTicketDatasource.remoteDeleteTicket();
  }

  @override
  Future<List<EventEntity>> remoteGetAllTickets() async {
    return remoteTicketDatasource.remoteGetAllTickets();
  }

  @override
  Future<BaseResponse> remoteUpdateTicket(EventEntity eventEntity) async {
    final EventModel eventModel = EventModel(
      title: eventEntity.title!,
      description: eventEntity.description!,
    );
    return await remoteTicketDatasource.remoteUpdateTicket(eventModel);
  }

  @override
  Future<BaseResponse> remoteAddComment(EventEntity eventEntity) async {
    return await remoteTicketDatasource
        .remoteAddComment(EventModel.fromEntity(eventEntity));
  }

  @override
  Future<List<String?>> remoteGetAllComment() {
    return remoteTicketDatasource.remoteGetAllComment();
  }

  @override
  Future<Account> remoteUploadMessage(String idUser, String message) {
    return remoteTicketDatasource.uploadMessage(
      idUser,
      message,
    );
  }

  @override
  Future<void> addMessage(MessageEntity messageEntity) {
    return remoteTicketDatasource.addMessage(messageEntity);
  }

  @override
  Stream<List<MessageEntity>> getMessages() {
    return remoteTicketDatasource.getMessages();
  }
}
