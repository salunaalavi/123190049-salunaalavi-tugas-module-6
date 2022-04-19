import 'package:hive/hive.dart';
import 'package:tugas_module_6/models/cart.dart';
class HiveBoxes {
  static Box<Item> getItems() =>
      Hive.box<Item>('items');
}
