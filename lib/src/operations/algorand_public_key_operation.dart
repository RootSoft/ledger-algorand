import 'dart:typed_data';

import 'package:algorand_dart/algorand_dart.dart';
import 'package:ledger_flutter/ledger.dart';

/// APDU Protocol
/// https://github.com/LedgerHQ/app-algorand/blob/develop/docs/APDUSPEC.md
class AlgorandPublicKeyOperation extends LedgerOperation<List<String>> {
  final int accountIndex;

  AlgorandPublicKeyOperation({
    this.accountIndex = 0,
  });

  @override
  Future<List<Uint8List>> write(ByteDataWriter writer) async {
    writer.writeUint8(0x80); // ALGORAND_CLA
    writer.writeUint8(0x03); // PUBLIC_KEY_INS
    writer.writeUint8(0x00); // P1_FIRST
    writer.writeUint8(0x00); // P2_LAST
    writer.writeUint8(0x04); // ACCOUNT_INDEX_DATA_SIZE

    writer.writeUint32(accountIndex); // Account index as bytearray

    return [writer.toBytes()];
  }

  @override
  Future<List<String>> read(ByteDataReader reader) async {
    return [
      Address(publicKey: reader.read(reader.remainingLength)).encodedAddress,
    ];
  }
}
