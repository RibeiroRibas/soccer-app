class RequestState {

  bool? _isRunning;
  bool? _hasFailed;

  bool? get isRunning => _isRunning;
  bool? get hasFailed => _hasFailed;
  bool get hasSucceeded => !isRunning! && !_hasFailed!;

  RequestState() {
    _isRunning = _hasFailed = false;
  }

  RequestState.running() {
    _isRunning = true;
    _hasFailed = false;
  }

  RequestState.failed() {
    _isRunning = false;
    _hasFailed = true;
  }

  RequestState.succeeded() {
    _isRunning = _hasFailed = false;
  }
}