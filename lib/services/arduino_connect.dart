import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

class ArduinoConnect extends StatefulWidget {
  const ArduinoConnect({Key? key}) : super(key: key);

  @override
  State<ArduinoConnect> createState() => _ArduinoConnectState();
}

class _ArduinoConnectState extends State<ArduinoConnect> {
  late UsbPort _port;
  late String _status;
  List<Widget> _ports = [];
  final List<Widget> _serialData = [];
  late StreamSubscription<String> _subscription;
  late Transaction<String> _transaction;
  late int _deviceId;

  Future<bool> _connectTo(device) async {
    _serialData.clear();
    _subscription.cancel();
    // _subscription = null;

    _transaction.dispose();
    // _transaction = null;

    _port.close();
    // _port = null;

    if (device == null) {
      _deviceId = 0;
      setState(() {
        _status = "Disconnected";
      });
      return true;
    }

    _port = await device.create();

    if (!await _port.open()) {
      setState(() {
        _status = "Failed to open port";
      });
      return false;
    }

    _deviceId = device.deviceId;
    await _port.setDTR(true);
    await _port.setRTS(true);
    await _port.setPortParameters(
        115200, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);

    _transaction = Transaction.stringTerminated(
        _port.inputStream!, Uint8List.fromList([13, 10]));

    _subscription = _transaction.stream.listen((String line) {
      setState(() {
        _serialData.add(Text(line));
        if (_serialData.length > 20) {
          _serialData.removeAt(0);
        }
      });
    });

    setState(() {
      _status = "Connected";
    });
    return true;
  }

  void _getPorts() async {
    _ports = [];
    List<UsbDevice> devices = await UsbSerial.listDevices();
    print(devices);

    for (var device in devices) {
      _ports.add(
        ListTile(
          leading: const Icon(Icons.usb),
          title: Text(device.productName!),
          subtitle: Text(device.manufacturerName!),
          trailing: ElevatedButton(
            child:
                Text(_deviceId == device.deviceId ? "Disconnect" : "Connect"),
            onPressed: () {
              _connectTo(_deviceId == device.deviceId ? null : device).then(
                (res) => {
                  _getPorts(),
                },
              );
            },
          ),
        ),
      );
    }

    setState(() {
      print(_ports);
    });
  }

  @override
  void initState() {
    super.initState();

    UsbSerial.usbEventStream?.listen((UsbEvent event) {
      _getPorts();
    });

    _getPorts();
  }

  @override
  void dispose() {
    super.dispose();
    _connectTo(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
