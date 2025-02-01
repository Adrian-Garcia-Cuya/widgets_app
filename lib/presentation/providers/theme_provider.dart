
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app_4/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider(( ref ) => true);

//listado de colores inmutable
final colorListProvider = Provider(( ref ) => colorList);