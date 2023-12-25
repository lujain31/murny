import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/models/user_model.dart';
import 'package:murny_final_project/widgets/order_bottom_sheet.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: USER PERMISSION
    // final isAllowed = await userPermission();
    // if (isAllowed) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) =>
    //           const GoogleMapScreen()));
    // }
    GoogleMapController? googleMapController;

    List<Marker> userMarker = [];
    LatLng userLocation = const LatLng(0, 0);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: BlocConsumer<MapBloc, MapState>(
              builder: (context, state) {
                return GoogleMap(
                  compassEnabled: true,
                  mapToolbarEnabled: true,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  mapType: MapType.satellite,
                  onLongPress: (onPressedDestination) {
                    userMarker = [];
                    context.read<MapBloc>().add(
                        MapGetLocationEvent(location: onPressedDestination));
                  },
                  markers: state is MapSetMarkersState
                      ? Set.from(state.userMarker)
                      : Set.from(userMarker),
                  initialCameraPosition: CameraPosition(
                      target: state is MapGetCurrentLocationState
                          ? userLocation = state.userLocation
                          : userLocation),
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                  },
                );
              },
              listener: (BuildContext context, MapState state) {
                state is MapSetMarkersState
                    ? userMarker.add(state.userMarker.first)
                    : const SizedBox();
                state is MapGetCurrentLocationState
                    ? userLocation = state.userLocation
                    : const SizedBox();
              },
            ),
          ),
          //TODO: ADD WIDGETS HERE
          // ElevatedButton(
          //     onPressed: () async {
          // await MurnyApi().signIn(function: Auth.userSignUp, body: {
          //   "email": "test@app.com",
          //   "password": "123456",
          //   "phone": "050454456",
          //   "name": "User"
          // });
          // },
          // child: const Text("Button"))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const OrderBottomSheet(),
    );
  }
}
