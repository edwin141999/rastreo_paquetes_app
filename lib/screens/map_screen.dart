import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rastreo_paquetes_app/styles/colors/colors.view.dart';
import 'package:rastreo_paquetes_app/styles/fonts/fonts_view.dart';
import 'package:rastreo_paquetes_app/widgets/logo_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(16.75688035617092, -93.17230778400948),
                  zoom: 16.8,
                ),
                zoomGesturesEnabled: false,
                zoomControlsEnabled: false,
                scrollGesturesEnabled: false,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 50,
                        color: ColorSelect.kColorPrimary,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .8,
                            child: const Text(
                              'Instituto Tecnológico de Tuxtla Gutiérrez',
                              style: FontSelect.k25BlackBold,
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Text(
                            'Tuxtla Gutiérrez',
                            style: FontSelect.k15GrayLightBold,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black, thickness: 2),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width * .8,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: ColorSelect.kColorSecondary,
                        side: const BorderSide(
                            color: ColorSelect.kColorSecondary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text(
                        'MOSTRAR RASTREO EN EL MAPA',
                        style: FontSelect.k20WhiteBold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: ColorSelect.kColorPrimary,
                      side: const BorderSide(color: ColorSelect.kColorPrimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: const Text(
                      'SALIR',
                      style: FontSelect.k20WhiteBold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
