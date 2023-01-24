import 'package:order/features/event/domain/reporisatory/ticket_reporisatory.dart';

class RemoteGetAllCommentsUsecase {
  final TicketReporisatory ticketReporisatory;

  RemoteGetAllCommentsUsecase(this.ticketReporisatory);

  Future<List<String?>> call() async {
    return await ticketReporisatory.remoteGetAllComment();
  }
}
