import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';

import '../../config/app_format.dart';
import '../../data/model/laundry.dart';

class DetailLaundry extends StatelessWidget {
  const DetailLaundry({Key? key, required this.laundry}) : super(key: key);
  final Laundry laundry;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        dataText('Customer', laundry.customerName!),
        dataText('Status', laundry.status!),
        dataText('Queue Date', AppFormat.date(laundry.queueDate!)),
        dataText('Queue Time', AppFormat.time(laundry.queueDate!)),
        dataText('Weight', '${laundry.weight} Kg'),
        dataText('Price', AppFormat.currency(laundry.price!)),
        DView.spaceHeight(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (laundry.startDate != null)
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text('Washing (Start)'),
              ),
            if (laundry.endDate != null)
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text('Done (End)'),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (laundry.startDate != null)
              Text(
                '${AppFormat.date(laundry.startDate!)}\n${AppFormat.time(laundry.startDate!)}',
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            if (laundry.endDate != null)
              Text(
                '${AppFormat.date(laundry.endDate!)}\n${AppFormat.time(laundry.endDate!)}',
                textAlign: TextAlign.right,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
          ],
        ),
      ],
    );
  }

  Widget dataText(String title, String body) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title:'),
        DView.spaceHeight(4),
        Text(
          body,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        DView.spaceHeight(),
      ],
    );
  }
}
