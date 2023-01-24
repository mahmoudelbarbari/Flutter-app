import 'package:order/features/event/domain/entities/event_entities.dart';
import 'package:order/features/event/domain/reporisatory/ticket_reporisatory.dart';

class AddMessageUsecase {
  final TicketReporisatory ticketReporisatory;

  AddMessageUsecase(this.ticketReporisatory);

  Future<void> call(MessageEntity messageEntity) async {
    return await ticketReporisatory.addMessage(messageEntity);
  }
}
