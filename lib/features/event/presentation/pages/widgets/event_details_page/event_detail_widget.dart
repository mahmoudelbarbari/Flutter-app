import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order/core/error/widgets/loading_widget.dart';
import 'package:order/features/event/domain/entities/event_entities.dart';
import 'package:order/features/event/presentation/cubit/ticket_cubit.dart';
import 'package:order/features/event/presentation/cubit/ticket_state.dart';
import 'package:order/features/event/presentation/pages/widgets/event_details_page/comment_details.dart';

class EventDetailWidget extends StatefulWidget {
  final EventEntity eventEntity;
  final MessageEntity? messageEntity;
  final String uid;
  final String userName;
  const EventDetailWidget({
    Key? key,
    this.messageEntity,
    required this.uid,
    required this.userName,
    required this.eventEntity,
  }) : super(key: key);

  @override
  State<EventDetailWidget> createState() => _EventDetailWidgetState();
}

class _EventDetailWidgetState extends State<EventDetailWidget> {
  TextEditingController addCommentcontroller = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<TicketCubit>(context).getTextMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketCubit, TicketState>(builder: ((context, state) {
      if (state is MessageLoadedState) {
        return _bodyWidget(state);
      }
      return const LoadingWidget();
    }));
  }

  Widget _bodyWidget(MessageLoadedState messages) {
    return Column(
      children: [
        _listEventWidget(),
        _listMessagesWidget(messages),
        _sendTextMessageWidget(),
      ],
    );
  }

  Widget _listMessagesWidget(MessageLoadedState messages) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: messages.messages.length,
        itemBuilder: (_, index) {
          return messages.messages[index] == widget.uid
              ? CommentDetails(
                  senderName: messages.messages[index].senderName,
                  text: messages.messages[index].message,
                  color: Colors.green[300],
                  uid: widget.uid,
                )
              : CommentDetails(
                  senderName: messages.messages[index].senderName,
                  text: messages.messages[index].message,
                  color: Colors.blue,
                );
        },
      ),
    );
  }

  Widget _listEventWidget() {
    return BlocProvider(
        create: (_) => TicketCubit(),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                widget.eventEntity.title!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                widget.eventEntity.description!,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _sendTextMessageWidget() {
    return TextField(
      controller: addCommentcontroller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.message),
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0),
            gapPadding: 10,
            borderRadius: BorderRadius.circular(25)),
        labelText: "Write a comment... ",
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          splashColor: Colors.black,
          tooltip: "Post comment ",
          onPressed: () {
            BlocProvider.of<TicketCubit>(context).sendTextMsg(
                uid: widget.uid,
                name: widget.userName,
                message: addCommentcontroller.text);
          },
        ),
      ),
    );
  }
}
