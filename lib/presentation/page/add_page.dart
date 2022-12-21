import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:test_lundry_app_learning/data/model/laundry.dart';
import 'package:test_lundry_app_learning/data/source/source_laundry.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  var controllerCustomerName = TextEditingController();
  var controllerWeight = TextEditingController();
  var controllerPrice = TextEditingController();

  add(var context) async {
    bool success = await SourceLaundry.add(Laundry(
      customerName: controllerCustomerName.text,
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      price: double.parse(controllerPrice.text),
      queueDate: DateTime.now(),
      status: 'Queue',
      weight: double.parse(controllerWeight.text),
    ));
    if (success) {
      DInfo.dialogSuccess(context, 'Success Add New Laundry');
      DInfo.closeDialog(context, actionAfterClose: () {
        Get.back(result: true);
      });
    } else {
      DInfo.dialogError(context, 'Failed Add New Laundry');
      DInfo.closeDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DView.appBarLeft('Add New'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DInput(
            controller: controllerCustomerName,
            title: 'Customer Name',
          ),
          DView.spaceHeight(),
          DInput(
            controller: controllerWeight,
            title: 'Weight',
            inputType: TextInputType.number,
          ),
          DView.spaceHeight(),
          DInput(
            controller: controllerPrice,
            title: 'Price',
            inputType: TextInputType.number,
          ),
          DView.spaceHeight(),
          ElevatedButton(
            onPressed: () {
              add(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
