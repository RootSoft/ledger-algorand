import 'dart:typed_data';

import 'package:ledger_algorand/ledger_algorand.dart';
import 'package:ledger_flutter/ledger.dart';

/// A [LedgerApp] used to perform BLE operations on a ledger [Algorand]
/// application.
///
/// https://github.com/LedgerHQ/app-algorand/blob/develop/docs/APDUSPEC.md
class AlgorandLedgerApp extends LedgerApp {
  static const errorExecution = 0x6400;
  static const errorEmptyBuffer = 0x6982;
  static const errorOutputBufferTooSmall = 0x6983;
  static const errorCommandNotAllowed = 0x6986;
  static const errorInsNotSupported = 0x6D00;
  static const errorClaNotSupported = 0x6E00;
  static const errorUnknown = 0x6F00;
  static const success = 0x8000;

  int accountIndex;

  AlgorandLedgerApp(
    super.ledger, {
    this.accountIndex = 0,
  });

  @override
  Future<AlgorandVersion> getVersion(LedgerDevice device) {
    return ledger.sendRequest<AlgorandVersion>(
      device,
      AlgorandVersionOperation(),
    );
  }

  @override
  Future<List<String>> getAccounts(LedgerDevice device) async {
    return ledger.sendRequest<List<String>>(
      device,
      AlgorandPublicKeyOperation(accountIndex: accountIndex),
    );
  }

  @override
  Future<Uint8List> signTransaction(
    LedgerDevice device,
    Uint8List transaction,
  ) {
    return ledger.sendRequest<Uint8List>(
      device,
      AlgorandSignMsgPackOperation(
        accountIndex: accountIndex,
        transaction: transaction,
      ),
    );
  }

  @override
  Future<List<Uint8List>> signTransactions(
    LedgerDevice device,
    List<Uint8List> transactions,
  ) async {
    final signatures = <Uint8List>[];
    for (var tx in transactions) {
      final signature = await signTransaction(device, tx);
      signatures.add(signature);
    }

    return signatures;
  }
}
