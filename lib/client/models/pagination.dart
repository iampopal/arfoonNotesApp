class Pagination {
  final int limit;
  final int page;
  final int? nextPage;
  const Pagination({
    required this.limit,
    required this.page,
    this.nextPage,
  });

  int get offset => page * limit;

  Pagination copyWith({
    int? limit,
    int? page,
    int? nextPage,
  }) {
    return Pagination(
      limit: limit ?? this.limit,
      page: page ?? this.page,
      nextPage: nextPage ?? this.nextPage,
    );
  }
}
