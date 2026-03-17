# scallop_reactive_ble_platform_interface

Scallop-maintained platform interface for the [reactive ble](https://github.com/PhilipsHue/flutter_reactive_ble/) plugin. This package ensures every platform-specific implementation uses the same interface.

## Credits

This package is derived from [`flutter_reactive_ble`](https://github.com/PhilipsHue/flutter_reactive_ble).

Original work:
- Copyright (c) 2019 Signify Holding
- Distributed under the BSD license in [LICENSE](LICENSE)

Fork maintenance:
- Updated and maintained in downstream fork for SDK / Flutter compatibility
- Current fork repository: https://github.com/fum-is-chum/flutter_reactive_ble

## Installation

```yaml
dependencies:
  scallop_reactive_ble_platform_interface: ^5.4.1
```

## Usage

Import:

```dart
import 'package:scallop_reactive_ble_platform_interface/scallop_reactive_ble_platform_interface.dart';
```

To implement a new platform-specific implementation, extend `ReactiveBlePlatform` with an implementation that performs the platform-specific behavior.
