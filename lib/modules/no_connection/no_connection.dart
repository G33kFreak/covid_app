import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/no_connection_ic.svg'),
              Text(
                'Whoops!',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Connection lost. Please check your connection.',
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
