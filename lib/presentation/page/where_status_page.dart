import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_format.dart';
import '../../controller/c_where_status.dart';
import '../../data/model/laundry.dart';
import 'detail_page.dart';

class WhereStatusPage extends StatefulWidget {
  const WhereStatusPage({Key? key, required this.status}) : super(key: key);
  final String status;

  @override
  State<WhereStatusPage> createState() => _WhereStatusPageState();
}

class _WhereStatusPageState extends State<WhereStatusPage> {
  final cWhereStatus = Get.put(CWhereStatus());

  refresh() {
    cWhereStatus.setList(widget.status);
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DView.appBarLeft(widget.status),
      body: GetBuilder<CWhereStatus>(
        builder: (_) {
          if (_.list.isEmpty) return DView.empty();
          return ListView.builder(
            itemCount: _.list.length,
            itemBuilder: (context, index) {
              Laundry laundry = _.list[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    Get.to(() => DetailPage(laundry: laundry))?.then((value) {
                      if (value ?? false) {
                        refresh();
                      }
                    });
                  },
                  leading: CircleAvatar(
                    radius: 18,
                    child: Text('${index + 1}'),
                  ),
                  horizontalTitleGap: 0,
                  title: Row(
                    children: [
                      Text(laundry.customerName!),
                      DView.spaceWidth(8),
                      Text(
                        '(${laundry.id})',
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppFormat.date(laundry.queueDate!)),
                      Text(AppFormat.time(laundry.queueDate!)),
                    ],///
                  ),
                  trailing: const Icon(Icons.navigate_next),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
