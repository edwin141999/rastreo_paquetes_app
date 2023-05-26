import 'package:flutter/foundation.dart';
import 'package:usb_serial/usb_serial.dart';

class ConnArduino {
  void onPressedConnectArduino() async {
    List<UsbDevice> devices = await UsbSerial.listDevices();
    print('DEVICES => $devices');
    UsbPort? port;

    if (devices.isEmpty) {
      return;
    }
    port = await devices[0].create();
    bool openResult = await port!.open();
    if (!openResult) {
      print('Failed to open port');
      return;
    }

    await port.setDTR(true);
    await port.setRTS(true);

    port.setPortParameters(
        96000, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);

    port.inputStream!.listen((Uint8List event) {
      print('EVENT => $event');
      port!.close();
    });

    await port.write(Uint8List.fromList([0x10, 0x00]));
  }
}
