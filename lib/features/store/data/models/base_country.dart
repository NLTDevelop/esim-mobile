
import 'package:equatable/equatable.dart';

abstract class BaseCountry extends Equatable {
  const BaseCountry({
    required this.name,
  });

  final String name;

  @override
  List<Object?> get props => [name];
}