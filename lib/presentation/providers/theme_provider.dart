import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app_4/config/theme/app_theme.dart';

//listado de colores inmutable
final colorListProvider = Provider(( ref ) => colorList);

final isDarkModeProvider = StateProvider(( ref ) => false);

final selectedColorProvider = StateProvider(( ref ) => 0);

//Permite manejar un estado mas complejo
//ThemeNotifier es el encargado de manejar el estado
//El tipo del estado para este caso es AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  ( ref ) => ThemeNotifier()
);

class ThemeNotifier extends StateNotifier<AppTheme> {

  //El "estado" es una nueva instancia del "AppTheme"
  ThemeNotifier(): super( AppTheme() );

  void toggleDarkMode()
  {
    state = state.copyWith( isDarkmode: !state.isDarkmode ); 
  }

  void changeColorIndex( int colorIndex )
  {
    state = state.copyWith( selectedColor: colorIndex );
  }
}
