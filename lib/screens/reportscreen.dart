import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

class ReportWasteScreen extends StatefulWidget {
  const ReportWasteScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReportWasteScreenState createState() => _ReportWasteScreenState();
}

class _ReportWasteScreenState extends State<ReportWasteScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  bool _isLoading = false;
  File? _imageFile;
  LatLng? _currentLocation;
  

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  // Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      _getCurrentLocation(); // Get location when image is captured

      // Show options dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('What would you like to do?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.account_balance),
                title: const Text('Report to Municipality'),
                onTap: () {
                  Navigator.of(context).pop();
                  // Handle report to municipality
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Selected: Report to Municipality')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('Sell Waste'),
                onTap: () {
                  Navigator.of(context).pop();
                  // Handle selling waste
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Selected: Sell Waste')),
                  );
                },
              ),
            ],
          ),
        ),
      );
    }
  }

  // Function to get current location using Geolocator
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
    });
  }

  // Function to center the map when tapped
  void _onMapTapped(LatLng tappedLocation) {
    setState(() {
      _currentLocation = tappedLocation; // Update the current location
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Waste'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description (optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
          
                // Show the captured image
                if (_imageFile != null)
                  Image.file(_imageFile!,
                      height: 200, width: double.infinity, fit: BoxFit.cover),
          
              const  SizedBox(height: 20),
          
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Capture Image'),
                ),
          
               const SizedBox(height: 20),
          
                // Show OpenStreetMap if location is available
                SizedBox(
                  height:300,
                  width:double.infinity,
                  child: FlutterMap(
                    options:const  MapOptions(
                      // Default to (0.0, 0.0) if location is null
                      minZoom: 15.0, // Explicit zoom level
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      ),
                      MarkerLayer(
                        markers: [
                          if (_currentLocation !=
                              null) // Only show marker if location is available
                            Marker(
                              width: 80.0,
                              height: 80.0,
                              point: _currentLocation!,
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
          
             const Spacer(),
          
                ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            await Future.delayed(Duration(seconds: 2));
                            setState(() {
                              _isLoading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Report submitted. Thank you!')),
                            );
                          }
                        },
                  child: _isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Submit Report'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
