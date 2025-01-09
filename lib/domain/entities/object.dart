
class BorrowedObject {
  final String username;
  final String object;
  final DateTime _borrowTime;
  final DateTime _returnTime;

  BorrowedObject({
    required this.username,
    required this.object,
    required DateTime borrowTime,
    required DateTime returnTime,
  })  : _borrowTime = borrowTime,
        _returnTime = returnTime;


  @override
  String toString() => 'BorrowedObject(username: $username, object: $object, borrowTime: $_borrowTime, returnTime: $_returnTime)';

}
