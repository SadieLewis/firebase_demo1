import 'package:flutter/material.dart';

class PeopleAttending extends StatefulWidget {
  final int attendees;
  final Function(int) onAttendeeChange;

  const PeopleAttending({
    Key? key,
    required this.attendees,
    required this.onAttendeeChange,
  }) : super(key: key);

  @override
  _PeopleAttendingState createState() => _PeopleAttendingState();
}

class _PeopleAttendingState extends State<PeopleAttending> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("  How many people will attend?"),
        const SizedBox(width: 8),
        SizedBox(
          width: 60,
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: ' ',
            ),
            keyboardType: TextInputType.number,
            onSubmitted: (value) {
              int attendees = int.tryParse(value) ?? 0;
              widget.onAttendeeChange(attendees);
              _controller.clear();
            },
          ),
        ),
      ],
    );
  }
}
