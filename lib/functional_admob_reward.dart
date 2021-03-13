import 'package:admob_flutter/admob_flutter.dart';
import 'package:rxdart/subjects.dart';

class FunctionalAdmobReward {
  final _subjectLoad = BehaviorSubject<bool>();
  final _subjectShow = BehaviorSubject<Map<String, dynamic>?>();
  late final AdmobReward _ad;

  FunctionalAdmobReward({
    required String adUnitId,
    bool nonPersonalizedAds = false,
  }) {
    this._ad = AdmobReward(
        adUnitId: adUnitId,
        listener: _createListener(),
        nonPersonalizedAds: nonPersonalizedAds);
  }

  Function(AdmobAdEvent event, Map<String, dynamic?>? map) _createListener() {
    return (AdmobAdEvent event, Map<String, dynamic?>? map) {
      // print('event: $event data: ${map}');
      switch (event) {
        case AdmobAdEvent.loaded:
          _subjectLoad.sink.add(true);
          _subjectLoad.close();
          break;
        case AdmobAdEvent.failedToLoad:
          _subjectLoad.addError(Exception('Failed to load Ad. $map'));
          break;
        case AdmobAdEvent.clicked:
          break;
        case AdmobAdEvent.impression:
          break;
        case AdmobAdEvent.opened:
          break;
        case AdmobAdEvent.leftApplication:
          break;
        case AdmobAdEvent.closed:
          print('### meet closed');
          if (_subjectShow.valueWrapper?.value == null) {
            _subjectShow.sink.add(null);
          }
          _subjectShow.close();
          break;
        case AdmobAdEvent.completed:
          break;
        case AdmobAdEvent.rewarded:
          _subjectShow.sink.add(map);
          break;
        case AdmobAdEvent.started:
          break;
      }
    };
  }

  Future<bool> load() {
    _ad.load();
    return _subjectLoad.first;
  }

  Future<Map<String, dynamic>?> show() async {
    _ad.show();
    final result = await _subjectShow.first;
    dispose();
    return result;
  }

  void dispose() {
    _ad.dispose();
  }
}
