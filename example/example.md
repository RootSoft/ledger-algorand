<br />
<div align="center">
  <a href="https://www.ledger.com/">
    <img src="https://algorand-developer-portal.tryprism.com/static/Posts/2020/08/18%2019:16/081820-ledger_nano.jpg?w=2220&cmd=resize_then_crop&height=1018&quality=70" width="600"/>
  </a>

<h1 align="center">ledger-algorand</h1>

<p align="center">
    A Flutter Ledger App Plugin for the Algorand blockchain
    <br />
    <a href="https://pub.dev/documentation/ledger_algorand/latest/"><strong>« Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/RootSoft/ledger_algorand/issues">Report Bug</a>
    · <a href="https://github.com/RootSoft/ledger_algorand/issues">Request Feature</a>
    · <a href="https://pub.dev/packages/ledger_flutter">Ledger Flutter</a>
  </p>
</div>
<br/>

---

```dart
/// Create a new instance of LedgerOptions.
final options = LedgerOptions(
  maxScanDuration: const Duration(milliseconds: 5000),
);

/// Create a new instance of Ledger.
final ledger = Ledger(
  options: options,
);

/// Create a new Algorand Ledger Plugin.
final algorandApp = AlgorandLedgerApp(ledger);

/// Scan for devices
ledger.scan().listen((device) => print(device));

/// or get a connected one
final device = ledger.devices.firstOrNull;

/// Fetch a list of accounts/public keys from your ledger.
final accounts = await algorandApp.getAccounts(device);
```