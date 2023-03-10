import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/screens/journal_screen/widgets/journal_screen.dart';

import '../../models/dao.dart';
import '../../models/journal.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  const AddJournalScreen({Key? key, required this.journal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JournalScreen(
      journal: journal,
      cntxt: context,
      func: registerJournal,
    );
  }

  registerJournal(BuildContext context, String title, String content) async {
    journal.title = title;
    journal.content = content;
    journal.updatedAt = DateTime.now();

    return await Dao.prepareForInsert(journal);
  }
}