part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetail;
  final RequestStates requestState;
  final String? message;
  final List<RecommendationModel>? recommendationModel;
  final RequestStates recommendationState;
  final String? recommendationMessage;

  const MovieDetailsState(
      {this.movieDetail,
      this.requestState = RequestStates.loading,
      this.message = " ",
      this.recommendationModel,
      this.recommendationState = RequestStates.loading,
      this.recommendationMessage = " "});

  MovieDetailsState copyWith({
    MovieDetails? movieDetail,
    RequestStates? requestState,
    String? message,
    List<RecommendationModel>? recommendationModel,
    RequestStates? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
      recommendationModel: recommendationModel ?? this.recommendationModel,
      recommendationState: recommendationState ?? this.recommendationState,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        requestState,
        message,
        recommendationModel,
        recommendationState,
        recommendationMessage
      ];
}
