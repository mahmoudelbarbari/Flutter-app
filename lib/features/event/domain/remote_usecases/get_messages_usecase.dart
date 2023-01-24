import 'package:order/features/event/domain/entities/event_entities.dart';
import 'package:order/features/event/domain/reporisatory/ticket_reporisatory.dart';

class GetMessageUsecase {
  final TicketReporisatory ticketReporisatory;
  GetMessageUsecase(this.ticketReporisatory);

  Stream<List<MessageEntity>> call() {
    return ticketReporisatory.getMessages();
  }
}
