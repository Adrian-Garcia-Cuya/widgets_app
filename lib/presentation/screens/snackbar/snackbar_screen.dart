import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {

  static const name = 'snack_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar( BuildContext context ) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'OK!', onPressed:() {}),
      duration: const Duration( seconds: 2 ),
    );
    ScaffoldMessenger.of(context).showSnackBar( snackbar );
  }

  void openDialog( BuildContext context ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Adipisicing laboris laboris excepteur reprehenderit proident fugiat pariatur id laborum elit. Nulla ea consectetur consectetur consequat proident est. Reprehenderit eiusmod consequat enim amet qui consectetur. Ex aliqua nostrud sit nisi consectetur ipsum fugiat deserunt velit amet duis reprehenderit eiusmod. Cillum adipisicing esse non culpa nostrud proident pariatur irure ipsum sit tempor ex non nulla. Eiusmod excepteur reprehenderit consequat sunt est et nulla laboris qui.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: const Text('Cancelar')
          ),
          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Aceptar')
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Ex do mollit id non elit veniam voluptate ea sit sint. Ipsum cupidatat duis est aute enim occaecat amet non reprehenderit elit cillum id. Est in dolor occaecat id consequat aliquip exercitation commodo. Reprehenderit anim deserunt enim elit. Nulla deserunt anim officia amet ad. Velit laboris nostrud enim amet ullamco cillum ad enim eiusmod tempor voluptate.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo')
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon( Icons.remove_red_eye_outlined ),
        onPressed: () => showCustomSnackbar( context ),
      ),
    );
  }
}