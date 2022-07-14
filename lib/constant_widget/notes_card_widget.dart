import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_withfirebase/screens/note_reader.dart';
import 'package:notes_app_withfirebase/style/app_style.dart';

class NoteCard extends StatelessWidget {
  final Map data;
  QueryDocumentSnapshot doc;
  NoteCard({
    required this.doc,
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ontap(doc) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => NoteReaderScreen(doc)),
    //   );
    // }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoteReaderScreen(doc)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppStyle.cardsColor[data['color_id']],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['note_title'],
              style: AppStyle.mainTitle,
            ),
            Text(
              data['creator_date_time'],
              style: AppStyle.datetimeTitle,
            ),
            Text(
              data['note_content'],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}




// Widget noteCard(Function()? ontap, QueryDocumentSnapshot doc) {
//   return InkWell(
//     onTap: ontap,
//     child: Container(
//       padding: const EdgeInsets.all(8.0),
//       margin: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: AppStyle.cardsColor[doc['color_id']],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             doc['note_title'],
//             style: AppStyle.mainTitle,
//           ),
//           Text(
//             doc['creator_date_time'],
//             style: AppStyle.datetimeTitle,
//           ),
//           Text(
//             doc['note_contenet'],
//             style: AppStyle.mainContent,
//           ),
//         ],
//       ),
//     ),
//   );
// }
