
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app_4/presentation/providers/counter_provider.dart';
import 'package:widgets_app_4/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  //El segundo parametro indica que se hara referencia a un provider
  Widget build( BuildContext context, WidgetRef ref ) {

    //watch -> retorna el valor expuesto por el provider y reconstruye el widget cuando cambia
    final int clickCounter = ref.watch( counterProvider );
    final bool isDarkMode = ref.watch( isDarkModeProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read( isDarkModeProvider.notifier ).state = !isDarkMode;
            },
            icon: Icon( isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read( counterProvider.notifier ).update(( state ) => state + 1 );
          ref.read( counterProvider.notifier ).state++;
        },
        child: const Icon( Icons.add ),
      ),
    );
  }
}