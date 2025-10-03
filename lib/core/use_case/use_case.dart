import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  const UseCase();

  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class PaginationPagePerPage extends Equatable {
  final int page;
  final int perPage;

  const PaginationPagePerPage({
    required this.page,
    required this.perPage,
  });

  @override
  List<Object?> get props => [page, perPage];
}

class PaginationOffset extends Equatable {
  final int offset;
  final int limit;

  const PaginationOffset({
    required this.offset,
    required this.limit,
  });

  @override
  List<Object?> get props => [offset, limit];
}

class SearchPaginationOffsetParams extends PaginationOffset {
  const SearchPaginationOffsetParams({
    required super.offset,
    required super.limit,
    this.search,
  });

  final String? search;

  @override
  List<Object?> get props => [super.props, search];
}
