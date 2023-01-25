import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order/core/error/widgets/loading_widget.dart';
import 'package:order/features/event/presentation/cubit/ticket_cubit.dart';
import 'package:order/features/event/presentation/cubit/ticket_state.dart';
import 'package:order/features/event/presentation/pages/ticket_widget.dart';
import 'package:order/features/event/presentation/pages/widgets/event_add_update_pages/event_add_update_page.dart';
import 'package:order/features/login/presentation/cubit/login_cubit.dart';
import 'package:order/features/login/presentation/cubit/login_state.dart';
import 'package:order/features/login/presentation/pages/login_page.dart';
import 'package:order/features/login/presentation/pages/login_widget.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

String greetings() {
  final hour = TimeOfDay.now().hour;

  if (hour <= 12) {
    return 'Good Morning';
  } else if (hour <= 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}

class _TicketPageState extends State<TicketPage> {
  final GlobalKey<FormState> _keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
        title: Text('Welcome, ${greetings()}'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(child: Container()),
            Column(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    context.read<LoginCubit>().logOut();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
                  },
                  icon: const Icon(Icons.logout_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(context),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocConsumer<TicketCubit, TicketState>(
        listener: (context, state) {
          if (state is TicketErrorState) {
            // final snackBar = SnackBar(content: Text(state.errorMessage));
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            print(state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is TicketLoadingState) {
            return const LoadingWidget();
          } else if (state is TicketLoadedState) {
            return TicketWidget(
              eventEntity: state.eventEntity,
            );
          } else if (state is TicketErrorState) {
            // final snackBar = SnackBar(content: Text(state.errorMessage));
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            print(state.errorMessage);
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  Widget _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const EventAddUpdatePage(
                      isUpdateEvent: false,
                    )));
      },
      child: const Icon(Icons.add),
    );
  }
}
