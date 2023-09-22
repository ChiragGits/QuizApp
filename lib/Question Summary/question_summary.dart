import 'package:flutter/material.dart';

import 'package:quizz_app/Question%20Summary/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // this will fixed the size of child to 300
      child: SingleChildScrollView(
        // if the child can't be shown in a 300 so we can use SingleChildScrollView to make it scrollable to view to full content
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SummaryItem(data),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
