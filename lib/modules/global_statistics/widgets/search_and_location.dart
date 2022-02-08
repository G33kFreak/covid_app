import 'package:covid_app/configs/colors.dart';
import 'package:covid_app/modules/global_statistics/bloc/global_statistics_bloc.dart';
import 'package:covid_app/modules/global_statistics/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchAndLocation extends StatelessWidget {
  const SearchAndLocation({Key? key}) : super(key: key);

  void _findMyLocation(BuildContext context) {
    context.read<GlobalStatisticsBloc>().add(RequestedMyLocation());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalStatisticsBloc, GlobalStatisticsState>(
      builder: (context, state) {
        return Row(
          children: [
            const Expanded(
              flex: 5,
              child: SearchBar(),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => state.locationLoadingStatus == LoadingStatus.done
                    ? _findMyLocation(context)
                    : null,
                child: Ink(
                  width: 65,
                  height: 60,
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: white,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: state.locationLoadingStatus == LoadingStatus.done
                        ? const Icon(
                            Icons.my_location_rounded,
                            color: background,
                            size: 22,
                          )
                        : const SpinKitRing(
                            color: background,
                            size: 25,
                            lineWidth: 2,
                          ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
