import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/utils/enums.dart';
import 'package:movies_application/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_application/movies/data/repository/moveis_repository.dart';
import 'package:movies_application/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_application/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_application/movies/presentation/controller/movies_events.dart';
import 'package:movies_application/movies/presentation/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNowPlayingUseCase getNowPlayingUseCase;
  MoviesBloc(this.getNowPlayingUseCase) : super(const MoviesState()) {
    on<GetNowPlayingEvent>((event, emit) async {
      var result = await getNowPlayingUseCase.execute();
      emit(MoviesState(nowPlayingState: RequestStates.loaded));
      result.fold(
          (l) => {
                emit(MoviesState(
                    nowPlayingState: RequestStates.error,
                    nowPlayingMessage: l.message))
              },
          (r) => {
                emit(MoviesState(
                    nowPlayingState: RequestStates.loaded, nowPlayingMovies: r))
              });
      print(result);
    });
  }
}
