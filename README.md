# functional_admob_flutter

Functional Admob Flutter

## Introduction

This project is a functional version of the [admob_flutter](https://pub.dev/packages/admob_flutter),

## First of all, you have to follow admob_flutter setup.
[from here](https://pub.dev/packages/admob_flutter#android-specific-setup)

## Simple Usage

#### FunctionalAdmobInterstitial
```
import 'package:functional_admob_flutter/functional_admob_interstitial.dart';
```

```
  Future _demoFunctionalInterstitial() async {
    final interstitialAd = FunctionalAdmobInterstitial(
      adUnitId: getInterstitialAdUnitId(),
    );

    if (!await interstitialAd.load()) throw 'Failed to load interstitial Ad';

    await interstitialAd.show();
  }
```

#### FunctionalAdmobReward
```
import 'package:functional_admob_flutter/functional_admob_reward.dart';
```

```
  Future _demoFunctionalReward() async {
    final rewardAd = FunctionalAdmobReward(
      adUnitId: getRewardBasedVideoAdUnitId(),
    );

    if (!await rewardAd.load()) throw 'Failed to load reward Ad';

    final result = await rewardAd.show();
    if (result != null) {
      _dialogRewarded(result);

      print('Type: ${result['type']}');
      print('Amount: ${result['amount']}');
    } else {
      print('failed to get reward!');
    }
  }
```