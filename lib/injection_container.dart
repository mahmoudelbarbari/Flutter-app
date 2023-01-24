import 'package:get_it/get_it.dart';
import 'package:order/core/database/firebase_db.dart';
import 'package:order/features/event/data/datasource/remote_ticket_datasource.dart';
import 'package:order/features/event/data/reporisatory/remote_ticket_reporisatory_impl.dart';
import 'package:order/features/event/domain/remote_usecases/add_comment_OnTicket.dart';
import 'package:order/features/event/domain/remote_usecases/add_message.dart';
import 'package:order/features/event/domain/remote_usecases/add_ticket.dart';
import 'package:order/features/event/domain/remote_usecases/delete_ticket.dart';
import 'package:order/features/event/domain/remote_usecases/get_messages_usecase.dart';
import 'package:order/features/event/domain/remote_usecases/message_usecase.dart';
import 'package:order/features/event/domain/remote_usecases/remote_get_all_comment.dart';
import 'package:order/features/event/domain/remote_usecases/remote_get_all_ticket.dart';
import 'package:order/features/event/domain/remote_usecases/update_ticket.dart';
import 'package:order/features/event/domain/reporisatory/ticket_reporisatory.dart';
import 'package:order/features/event/presentation/cubit/ticket_cubit.dart';
import 'package:order/features/login/data/datasources/remote_login_user.dart';
import 'package:order/features/login/domain/usecases/login_usecase.dart';
import 'package:order/features/login/domain/usecases/remote_login_usecase.dart';
import 'package:order/features/login/presentation/cubit/login_cubit.dart';
import 'package:order/features/register/data/datasource/remote_register_user_datasource.dart';
import 'package:order/features/register/data/reporisatory/register_reporisatory_impl.dart';
import 'package:order/features/register/domain/reposisatory/register_reprisatory.dart';
import 'package:order/features/register/domain/usecase/register_usecase.dart';
import 'package:order/features/register/domain/usecase/remote_register_usecase.dart';
import 'features/login/data/datasources/local_login_user.dart';
import 'features/login/data/reporisatory/account_reporisatory_impl.dart';
import 'features/login/domain/repositories/account_repository.dart';

final sl = GetIt.instance;

void init() {
  //lazy singleton will call the object when needed ONLY, the singleton when the app launched it will
  //the objects
  //new DB
  sl.registerLazySingleton(() => FirebaseDatabseProvider());
  //sl.registerLazySingleton(() => DatabaseProvider());

  //olddb
  sl.registerLazySingleton<LocalDatabaseDataSource>(
      () => DatabaseDataSourceImpl(sl()));

  sl.registerLazySingleton<RemoteLoginDatasource>(
      () => RemoteLoginDatasourceImpl(sl()));

  //Account_Repository
  sl.registerLazySingleton<AccountRepository>(
      () => AccountRepositoryImlp(sl()));

  //usecases with singelton dessign pattern
  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(sl()));
  sl.registerLazySingleton<RemoteLoginUsecase>(() => RemoteLoginUsecase(sl()));

  //Login bloc cubit
  sl.registerFactory<LoginCubit>(() => LoginCubit());

//-----------------------------------------------------------------------------------------
// Register feature (injection).
//-----------------------------------------------------------------------------------------

  //datasource Register for db
  // sl.registerLazySingleton<RegisterDatasource>(
  //     () => RegisterDatasourceImpl(sl<DatabaseProvider>()));
  sl.registerLazySingleton<RemoteRegisterDatasource>(
      () => RemoteRegisterDatasourceImlp(sl()));

  //Register_Repository
  sl.registerLazySingleton<RegisterAccountRepository>(
      () => RegisterReporisatoryImpl(sl<RemoteRegisterDatasource>()));

  //Registerusecase
  sl.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(sl<RegisterAccountRepository>()));
  sl.registerLazySingleton<RemoteRegisterUsecase>(
      () => RemoteRegisterUsecase(sl<RegisterAccountRepository>()));

  //register bloc cubit
  // sl.registerLazySingleton(() => RegisterCubit());

  //-----------------------------------------------------------------------------------------
  // Ticket feature (injection).
  //-----------------------------------------------------------------------------------------

  //datasource event for db
  // sl.registerLazySingleton(() => EventDatasourceImpl(sl()));
  sl.registerLazySingleton<RemoteTicketDatasource>(
      () => RemoteTicketDatasourceImpl(sl<FirebaseDatabseProvider>()));

  //Event_Repository
  // sl.registerLazySingleton<EventRepsitory>(() => EventReporisatoryImpl(sl()));
  sl.registerLazySingleton<TicketReporisatory>(
      () => TicketReporisatoryImlp(sl<RemoteTicketDatasource>()));

  // //Event_Usecases
  // sl.registerLazySingleton(() => GetAllEventsUsecase(sl()));
  // sl.registerLazySingleton(() => GetAllCommentsUsecase(sl()));
  // sl.registerLazySingleton(() => CommentOnEventUsecase(sl()));
  // sl.registerLazySingleton(() => AddEventUsecase(sl()));
  // sl.registerLazySingleton(() => UpdateEventUsecase(sl()));
  // sl.registerLazySingleton(() => DeleteEventUsecase(sl()));

  //Remote_Ticket_Usecases
  sl.registerLazySingleton<RemoteGetAllCommentsUsecase>(
      () => RemoteGetAllCommentsUsecase(sl<TicketReporisatory>()));
  sl.registerLazySingleton<AddCommentUsecase>(
      () => AddCommentUsecase(sl<TicketReporisatory>()));
  sl.registerLazySingleton<AddTicketUsecase>(
      () => AddTicketUsecase(sl<TicketReporisatory>()));
  sl.registerLazySingleton<UpdateTicketUsecase>(
      () => UpdateTicketUsecase(sl<TicketReporisatory>()));
  sl.registerLazySingleton<DeleteTicketUsecase>(
      () => DeleteTicketUsecase(sl<TicketReporisatory>()));
  sl.registerLazySingleton<GetAllTicketUsecase>(
      () => GetAllTicketUsecase(sl<TicketReporisatory>()));
  sl.registerLazySingleton<AddMessageUsecase>(
      () => AddMessageUsecase(sl<TicketReporisatory>()));
  sl.registerLazySingleton<GetMessageUsecase>(
      () => GetMessageUsecase(sl<TicketReporisatory>()));
  sl.registerLazySingleton<UploadMessageUsecase>(
      () => UploadMessageUsecase(sl<TicketReporisatory>()));

  //Event bloc cubit
  // sl.registerLazySingleton(() => EventCubit());
  sl.registerFactory(() => TicketCubit());
}
