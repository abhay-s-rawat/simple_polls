/// This file contains the results widget.
import 'package:flutter/material.dart';
import '../models/poll_models.dart';
import 'progress_widget.dart';

class PollResultsWidget extends StatelessWidget {
  /// This widget will show the results of poll.
  final double percentage;
  final PollOptions optionModel;
  final TextStyle? optionsStyle;
  const PollResultsWidget({
    Key? key,
    required this.percentage,
    required this.optionModel,
    this.optionsStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      dense: true,
      title: Stack(
        alignment: Alignment.centerLeft,
        children: [
          /// CustomLinearProgressBar is a widget that works like a progress bar but will be static.
          CustomLinearProgressBar(
            value: percentage,
          ),

          /// This will create the label of the option in results screen.
          Row(
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    optionModel.label,
                    overflow: TextOverflow.ellipsis,
                    style: optionsStyle ??
                        TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),

              /// If [optionModel.isSelected] is true a circle with tick will appear after that label,which indicates the selected of that particular option.
              if (optionModel.isSelected == true)
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 18,
                  ),
                ),
            ],
          ),
        ],
      ),

      /// Trailing portion will show the percentage of polls for each option.
      trailing: Text(
        '${(percentage * 100).toStringAsFixed(1)}%',
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
