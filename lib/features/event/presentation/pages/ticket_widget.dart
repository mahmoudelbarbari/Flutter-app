import 'package:flutter/material.dart';
import 'package:order/features/event/domain/entities/event_entities.dart';
import 'package:order/features/event/presentation/pages/widgets/event_details_page/event_detail_page.dart';

class TicketWidget extends StatelessWidget {
  final List<EventEntity> eventEntity;
  const TicketWidget({
    Key? key,
    required this.eventEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: eventEntity.length,
      itemBuilder: (context, index) {
        return ListTile(
          trailing: const Icon(Icons.arrow_circle_right),
          title: Text(
            eventEntity[index].title!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            eventEntity[index].description!,
            style: const TextStyle(fontSize: 16),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EventDetailsPage(
                  eventEntity: eventEntity[index],
                  uid: '',
                  userName: '',
                ),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => const Divider(thickness: 1),
    );
  }
}
