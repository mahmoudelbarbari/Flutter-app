import 'package:flutter/material.dart';
import 'package:order/features/event/domain/entities/event_entities.dart';
import 'package:order/features/event/presentation/pages/widgets/event_details_page/event_detail_widget.dart';

class EventDetailsPage extends StatelessWidget {
  final EventEntity eventEntity;
  final String uid;
  final String userName;
  const EventDetailsPage({
    Key? key,
    required this.uid,
    required this.userName,
    required this.eventEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: EventDetailWidget(
          eventEntity: eventEntity,
          uid: uid,
          userName: userName,
        ),
      ),
    );
  }
}
