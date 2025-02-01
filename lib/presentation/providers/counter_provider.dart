import 'package:flutter_riverpod/flutter_riverpod.dart';

//StateProvider -> expone un valor que puede ser modificado desde afuera (otro widget)
final counterProvider = StateProvider(( ref ) => 5);