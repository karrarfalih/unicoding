import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CardPreview extends StatelessWidget {
  const CardPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: AlertDialog(
              title: Text('Hello dialog!',),
              content: Text('Hello I am a message. I has been written by Karrar.',),
              actions: [
                TextButton(onPressed: (){}, child: Text('Ok')),
                TextButton(onPressed: (){}, child: Text('Cancel'))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
