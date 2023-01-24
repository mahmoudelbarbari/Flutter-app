import 'package:order/features/event/domain/reporisatory/ticket_reporisatory.dart';
import 'package:order/features/login/domain/entities/account_entites.dart';

class UploadMessageUsecase {
  final TicketReporisatory ticketReporisatory;
  UploadMessageUsecase(this.ticketReporisatory);

  Future<Account> call(String idUser, String message) async {
    return await ticketReporisatory.remoteUploadMessage(idUser, message);
  }
}
