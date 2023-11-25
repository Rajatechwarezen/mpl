
import 'package:uuid/uuid.dart';

String generateUniqueId() {
  // Create a Uuid object
  var uuid = Uuid();

  // Generate a unique identifier
  String uniqueId = uuid.v4();

  return uniqueId;
}