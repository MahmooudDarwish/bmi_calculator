part of 'bmi_history_bloc.dart';

@immutable
class BmiHistoryState extends Equatable {
  final String getBmiHistoryMessage;
  final RequestState getBmiHistoryState;
  final List<BmiEntryWithId> bmiHistoryList;
  final List<BmiEntryWithId> displayedItems;
  final int totalPage;
  final int itemsPerPage;
  final String deleteBmiEntryMessage;
  final RequestState deleteBmiEntryState;
  final int currentPage;

  const BmiHistoryState({
    this.getBmiHistoryMessage = '',
    this.getBmiHistoryState = RequestState.idle,
    this.bmiHistoryList = const [],
    this.displayedItems = const [],
    this.totalPage = 0,
    this.itemsPerPage = 10,
    this.deleteBmiEntryMessage = '',
    this.deleteBmiEntryState = RequestState.idle,
    this.currentPage = 0,
  });

  BmiHistoryState copyWith({
    String? getBmiHistoryMessage,
    RequestState? getBmiHistoryState,
    List<BmiEntryWithId>? bmiHistoryList,
    List<BmiEntryWithId>? displayedItems,
    int? totalPage,
    int? itemsPerPage,
    String? deleteBmiEntryMessage,
    RequestState? deleteBmiEntryState,
    int? currentPage,
  }) {
    return BmiHistoryState(
      getBmiHistoryMessage: getBmiHistoryMessage ?? this.getBmiHistoryMessage,
      getBmiHistoryState: getBmiHistoryState ?? this.getBmiHistoryState,
      bmiHistoryList: bmiHistoryList ?? this.bmiHistoryList,
      displayedItems: displayedItems ?? this.displayedItems,
      totalPage: totalPage ?? this.totalPage,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      deleteBmiEntryMessage:
          deleteBmiEntryMessage ?? this.deleteBmiEntryMessage,
      deleteBmiEntryState: deleteBmiEntryState ?? this.deleteBmiEntryState,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [
        getBmiHistoryMessage,
        getBmiHistoryState,
        bmiHistoryList,
        displayedItems,
        totalPage,
        itemsPerPage,
        deleteBmiEntryMessage,
        deleteBmiEntryState,
        currentPage,
      ];
}
