import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'content.g.dart';

@HiveType(typeId: 1)
class Content {
  @HiveField(0)
  String name;
  @HiveField(1)
  String location;
  Content(this.name, this.location);
}
