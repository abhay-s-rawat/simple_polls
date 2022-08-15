/// This file contains the widget which will appear the below the options widget.
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../models/poll_models.dart';
import '../translations/translations.dart';

class PollStatusWidget extends StatefulWidget {
  /// This widget will show status of the polls.
  /// It shows total polls, time remaining in polling and undo button(if poll is editable).
  final PollFrameModel model;
  final String languageCode;
  final Function() onUndo;
  const PollStatusWidget({
    Key? key,
    required this.model,
    required this.languageCode,
    required this.onUndo,
  }) : super(key: key);

  @override
  State<PollStatusWidget> createState() => _PollStatusWidgetState();
}

class _PollStatusWidgetState extends State<PollStatusWidget> {
  @override
  void initState() {
    super.initState();

    /// This portion will register these languages for timeago/timefromnow translation. Add more languages to register for more languages.
    /// This will only translate time relation to now. For example, '5 minutes from now' will be translated to appropriate language.
    /// Italian language registration.
    timeago.setLocaleMessages('it', timeago.ItMessages());

    /// French language registration.
    timeago.setLocaleMessages('fr', timeago.FrMessages());

    /// Spanish language registration.
    timeago.setLocaleMessages('es', timeago.EsMessages());

    /// German language registration.
    timeago.setLocaleMessages('gr', timeago.GrMessages());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            '${widget.model.totalPolls} ${polls_translation[widget.languageCode]!}',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        const Text(
          ' • ',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Flexible(
          flex: 2,
          child: Text(
            widget.model.endTime!.isBefore(DateTime.now().toUtc())
                ? polling_ended_translation[widget.languageCode]!
                : '${ends_translation[widget.languageCode]!}: ${timeago.format(
                    widget.model.endTime!,
                    allowFromNow: true,
                    locale: widget.languageCode,
                  )}',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),

        /// This checks if post is editable and user has selected an option.
        /// If [model.editablePoll] evaluates to tue and [model.hasVoted] evaluates to true an 'undo' button will show up which on pressed will remove the option selection and lets user select an option again.
        /// If poll time expires undo button will not be visible.
        if ((widget.model.editablePoll == true) &&
            (widget.model.hasVoted == true) &&
            (widget.model.endTime!
                .toUtc()
                .isAfter(DateTime.now().toUtc()))) ...[
          const Text(
            ' • ',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: widget.onUndo,
              child: Text(
                undo_poll_translation[widget.languageCode]!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }
}
