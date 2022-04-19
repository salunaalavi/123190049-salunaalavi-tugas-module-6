import 'package:hive/hive.dart';
part 'cart.g.dart';

@HiveType(typeId: 0)
class Item extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  Item({
    required this.title,
    required this.description,
  });
}
