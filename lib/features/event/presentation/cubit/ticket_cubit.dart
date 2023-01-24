import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order/features/event/domain/entities/event_entities.dart';
import 'package:order/features/event/domain/remote_usecases/add_comment_OnTicket.dart';
import 'package:order/features/event/domain/remote_usecases/add_message.dart';
import 'package:order/features/event/domain/remote_usecases/add_ticket.dart';
import 'package:order/features/event/domain/remote_usecases/delete_ticket.dart';
import 'package:order/features/event/domain/remote_usecases/get_messages_usecase.dart';
import 'package:order/features/event/domain/remote_usecases/message_usecase.dart';
import 'package:order/features/event/domain/remote_usecases/remote_get_all_comment.dart';
import 'package:order/features/event/domain/remote_usecases/remote_get_all_ticket.dart';
import 'package:order/features/event/domain/remote_usecases/update_ticket.dart';
import 'package:order/features/event/presentation/cubit/ticket_state.dart';
import 'package:order/injection_container.dart';

class TicketCubit extends Cubit<TicketState> {
  late AddTicketUsecase addTicketUsecase;
  late RemoteGetAllCommentsUsecase remoteGetAllCommentsUsecase;
  late AddCommentUsecase addCommentUsecase;
  late DeleteTicketUsecase deleteTicketUsecase;
  late UpdateTicketUsecase updateTicketUsecase;
  late GetAllTicketUsecase getAllTicketUsecase;
  late UploadMessageUsecase uploadMessageUsecase;
  //last
  late AddMessageUsecase addMessageUsecase;
  late GetMessageUsecase getMessageUsecase;
  TicketCubit() : super(TicketStateInt());

  Future<void> getAllTickets() async {
    try {
      emit(TicketLoadingState());
      getAllTicketUsecase = sl();
      final allTicket = await getAllTicketUsecase.call();
      emit(TicketLoadedState(eventEntity: allTicket));
    } catch (e) {
      emit(TicketErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getAllComments() async {
    try {
      emit(TicketLoadingState());
      remoteGetAllCommentsUsecase = sl();
      final allComments = await remoteGetAllCommentsUsecase.call();
      emit(CommentLoadedState(eventEntity: allComments));
    } catch (e) {
      emit(TicketErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> addTicket(EventEntity eventEntity) async {
    try {
      emit(TicketLoadingState());
      addTicketUsecase = sl();
      final addedTicket = await addTicketUsecase.call(eventEntity);
      if (addedTicket.status) {
        emit(TicketSuccessState(addedTicket));
      } else {
        emit(TicketErrorState(errorMessage: addedTicket.message));
      }
    } catch (e) {
      emit(TicketErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> remoteAddComment(EventEntity eventEntity) async {
    try {
      emit(TicketLoadingState());
      addCommentUsecase = sl();
      final addedComment = await addCommentUsecase.call(eventEntity);
      if (addedComment.status) {
        emit(CommentSuccessState(addedComment));
        final allComments = await remoteGetAllCommentsUsecase.call();
        emit(CommentLoadedState(eventEntity: allComments));
      } else {
        emit(TicketErrorState(errorMessage: addedComment.message));
      }
    } catch (e) {
      emit(TicketErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> remoteAddMessage({
    required String idUser,
    required String message,
  }) async {
    try {
      emit(TicketLoadingState());
      uploadMessageUsecase = sl();
      final addedMessage = await uploadMessageUsecase.call(idUser, message);
      emit(MessageSuccessState(addedMessage));
    } catch (e) {
      emit(TicketErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> deleteTicket() async {
    try {
      emit(TicketLoadingState());
      deleteTicketUsecase = sl();
      final deletedTicket = await deleteTicketUsecase.call();
      if (deletedTicket.status) {
        emit(TicketSuccessState(deletedTicket));
      } else {
        emit(TicketErrorState(errorMessage: deletedTicket.message));
      }
    } catch (e) {
      emit(TicketErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> updateTicket(EventEntity eventEntity) async {
    try {
      emit(TicketLoadingState());
      updateTicketUsecase = sl();
      final updatedTicket = await updateTicketUsecase.call(eventEntity);
      if (updatedTicket.status) {
        emit(TicketSuccessState(updatedTicket));
      } else {
        emit(TicketErrorState(errorMessage: updatedTicket.message));
      }
    } catch (e) {
      emit(TicketErrorState(errorMessage: e.toString()));
    }
  }

//last
  Future<void> sendTextMsg(
      {required String name,
      required String uid,
      required String message}) async {
    try {
      addMessageUsecase = sl();
      await addMessageUsecase.call(MessageEntity(uid, message, name, ""));
    } catch (e) {
      emit(TicketErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getTextMessages() async {
    try {
      emit(TicketLoadingState());
      getMessageUsecase = sl();
      final messages = getMessageUsecase.call();
      messages.listen((msg) {
        emit(MessageLoadedState(messages: msg));
      });
    } catch (e) {
      emit(TicketErrorState(errorMessage: e.toString()));
    }
  }
}
