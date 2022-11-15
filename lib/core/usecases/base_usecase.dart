import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_application/core/error/failure.dart';

abstract class BaseUseCase<T,Parameter> {
  Future<Either<Failure, T>> call(Parameter parameter);
}


class EmptyParameter extends Equatable {
  @override
  List<Object> get props => [];
}