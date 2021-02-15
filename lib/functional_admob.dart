import 'package:flutter/foundation.dart';

import 'functional_admob_interstitial.dart';
import 'functional_admob_reward.dart';

class FunctionalAdmob {
  static Future<void> interstitial({
    @required String adUnitId,
    bool nonPersonalizedAds = false,
  }) async {
    final ad = FunctionalAdmobInterstitial(
      adUnitId: adUnitId,
      nonPersonalizedAds: nonPersonalizedAds,
    );

    if (!await ad.load()) throw 'Failed to load interstitial Ad';

    return await ad.show();
  }

  static Future<Map<String, dynamic>> reward({
    @required String adUnitId,
    bool nonPersonalizedAds = false,
  }) async {
    final ad = FunctionalAdmobReward(
      adUnitId: adUnitId,
      nonPersonalizedAds: nonPersonalizedAds,
    );

    if (!await ad.load()) throw 'Failed to load reward Ad';

    return await ad.show();
  }
}
