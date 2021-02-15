import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';

class FunctionalAdmobInterstitial {
  final _subjectLoad = BehaviorSubject<bool>();
  final _subjectShow = BehaviorSubject<bool>();
  AdmobInterstitial _interstitialAd;

  FunctionalAdmobInterstitial({
    @required String adUnitId,
    bool nonPersonalizedAds = false,
  }) {
    this._interstitialAd = AdmobInterstitial(
        adUnitId: adUnitId,
        listener: _createListener(),
        nonPersonalizedAds: nonPersonalizedAds);
  }

  Function(AdmobAdEvent event, Map<String, dynamic> map) _createListener() {
    return (AdmobAdEvent event, Map<String, dynamic> map) {
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
          _subjectShow.sink.add(true);
          _subjectShow.close();
          break;
        case AdmobAdEvent.completed:
          break;
        case AdmobAdEvent.rewarded:
          break;
        case AdmobAdEvent.started:
          break;
      }
    };
  }

  Future<bool> load() {
    _interstitialAd.load();
    return _subjectLoad.first;
  }

  Future<void> show() async {
    _interstitialAd.show();
    final result = await _subjectShow.done;
    dispose();
    return result;
  }

  void dispose() {
    _interstitialAd.dispose();
  }
}
