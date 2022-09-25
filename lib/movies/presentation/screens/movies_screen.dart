import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_application/movies/presentation/controller/movies_events.dart';
import 'package:movies_application/movies/presentation/controller/movies_states.dart';

import '../../../core/services/service_locator.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MoviesBloc(sl())..add(GetNowPlayingEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          print(state);
          return const Scaffold();
        },
      ),
    );
  }
}
