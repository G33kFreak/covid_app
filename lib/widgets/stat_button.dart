import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid_app/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum StatData { global, local }

class StatButton extends StatelessWidget {
  final StatData statData;
  final String label;
  final int? data;
  final bool isSelected;
  final Function()? onTap;

  const StatButton({
    Key? key,
    required this.label,
    this.data,
    this.statData = StatData.global,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  Widget _getGlobal(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: AutoSizeText(
            label,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 12,
                ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
        const SizedBox(height: 5),
        Flexible(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: isSelected ? accent : null),
            child: AutoSizeText(
              data.toString(),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
        )
      ],
    );
  }

  Widget _getNeededType(BuildContext context) {
    return _getGlobal(context);
  }

  Widget _getLoader() => const SpinKitRing(
        color: graphGradientStart,
        lineWidth: 2,
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * .33;
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Ink(
          height: size,
          padding: const EdgeInsets.all(10),
          //alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: background,
            boxShadow: [
              BoxShadow(
                color: buttonShadow.withOpacity(0.33),
                offset: const Offset(0, 5.15),
                blurRadius: 1.15,
                spreadRadius: -1.15,
              ),
            ],
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            child: data != null ? _getNeededType(context) : _getLoader(),
          ),
        ),
      ),
    );
  }
}
