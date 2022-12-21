import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/status.dart';
import '../../data/model/laundry.dart';
import '../../data/source/source_laundry.dart';
import '../component/detail_laundry.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.laundry}) : super(key: key);
  final Laundry laundry;

  updateStatus(var contex) async {
    final controller = TextEditingController(text: laundry.status);
    var result = await Get.dialog(
      AlertDialog(
        title: const Text('Update Status'),
        content: DropdownButtonFormField<String>(
          value: controller.text,
          items: Status.listMenu.map((e) {
            return DropdownMenuItem<String>(value: e, child: Text(e));
          }).toList(),
          onChanged: (value) {
            controller.text = value ?? "";
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
    if ((result ?? false) && controller.text != '') {
      bool success =
          await SourceLaundry.updateStatus(laundry.id!, controller.text);
      if (success) {
        DInfo.dialogSuccess(contex, 'Success Update Status');
        DInfo.closeDialog(contex, actionAfterClose: () {
          Get.back(result: true);
        });
      } else {
        DInfo.dialogError(contex, 'Failed Update Status');
        DInfo.closeDialog(contex);
      }
    }
  }

  delete(var contex) async {
    bool? yes =
        await DInfo.dialogConfirmation(contex, 'Delete', 'Yes to confirm');
    if (yes != null && yes) {
      bool success = await SourceLaundry.delete(laundry.id!);
      if (success) {
        DInfo.dialogSuccess(contex, 'Success Delete Laundry');
        DInfo.closeDialog(contex, actionAfterClose: () {
          Get.back(result: true);
        });
      } else {
        DInfo.dialogError(contex, 'Failed Delete Laundry');
        DInfo.closeDialog(contex);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Laundry'),
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () => updateStatus(context),
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () => delete(context),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: DetailLaundry(laundry: laundry),
    );
  }
}
