import 'package:get/get.dart';

import '../data/model/laundry.dart';
import '../data/source/source_laundry.dart';

class CWhereStatus extends GetxController {
  final _list = <Laundry>[].obs;
  List<Laundry> get list => _list.value;
  setList(String status) async {
    _list.value = await SourceLaundry.whereStatus(status);
    update();
  }
}
