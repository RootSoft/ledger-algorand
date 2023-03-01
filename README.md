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

## Overview

Ledger Nano devices are the perfect hardware wallets for managing your crypto & NFTs on the go.
This Flutter package is a plugin for the [ledger_flutter](https://pub.dev/packages/ledger_flutter) package to get accounts and sign transactions using the Algorand blockchain.

### Web3 Ecosystem Integrations

We are expanding the Flutter ecosystem to grow the Web3 community.
Check out our other Web3 packages below:

- [Ledger](https://pub.dev/packages/ledger_flutter)
- [WalletConnect](https://pub.dev/packages/walletconnect_dart)
- [Algorand](https://pub.dev/packages/algorand_dart)

## Getting started

### Installation

Install the latest version of this package via pub.dev:

```yaml
ledger_algorand: ^latest-version
```

For integration with the Ledger Flutter package, check out the documentation [here](https://pub.dev/packages/ledger_flutter).

### Setup

Create a new instance of an `AlgorandLedgerApp` and pass an instance of your `Ledger` object.

```dart
final app = AlgorandLedgerApp(ledger);
```

## Usage

### Get public keys

Depending on the required blockchain and Ledger Application Plugin, the `getAccounts()` method can be used to fetch the public keys from the Ledger Nano device.


Based on the implementation and supported protocol, there might be only one public key in the list of accounts.

```dart
final accounts = await app.getAccounts(device);
```

### Signing transactions

You can easily sign transactions using the supplied `LedgerApp`.

Here is an example using the [algorand_dart](https://pub.dev/packages/algorand_dart) SDK:

```dart
final signature = await app.signTransaction(
    device,
    transaction.toBytes(),
);

final signedTx = SignedTransaction(
  transaction: event.transaction,
  signature: signature,
);

final txId = await algorand.sendTransaction(
    signedTx,
    waitForConfirmation: true,
);
```

## Sponsors

Our top sponsors are shown below!

<table>
    <tbody>
        <tr>
            <td align="center" style="background-color: white">
                <a href="https://defly.app/"><img src="https://play-lh.googleusercontent.com/Qr5ob7KMKf7gfxR4sQOCzs4LKi3pjCbbIBi7MkevWVP6SrEhS2vjDaqzDXyr9xWAYRMz=w240-h480-rw" width="225"/></a>
                <p><a href="https://defly.app/"><strong>Defly</strong></a></p>
            </td>
            <td align="center" style="background-color: white">
                <a href="https://blockshake.io/"><img src="https://pbs.twimg.com/profile_images/1491803720593522691/7jXDOpGn_400x400.png" width="225"/></a>
                <p><a href="https://blockshake.io/"><strong>Blockshake</strong></a></p>
            </td>
        </tr>
    </tbody>
</table>

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag `enhancement`.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/my-feature`)
3. Commit your Changes (`git commit -m 'feat: my new feature`)
4. Push to the Branch (`git push origin feature/my-feature`)
5. Open a Pull Request

Please read our [Contributing guidelines](CONTRIBUTING.md) and try to follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

## License

The ledger_algorand SDK is released under the MIT License (MIT). See LICENSE for details.