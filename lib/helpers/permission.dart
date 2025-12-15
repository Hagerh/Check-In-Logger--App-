import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

Future<void> requestLocationPermission(BuildContext context) async {
  
  PermissionStatus status = await Permission.location.status;

  if (status.isGranted) {

    print("Location granted");
    return;
  }

  if (status.isDenied) {
    
    status = await Permission.location.request();
  }

  // 3. Handle the result
  if (status.isGranted) {
    print("User granted permission");
  } else if (status.isPermanentlyDenied) {
    // 4. Handle Permanent Denial
    // If the user clicked "Don't ask again" (Android) or "Don't Allow" (iOS),
    // the OS dialog will NOT show again. We must send them to Settings.
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Permission Required"),
        content: const Text(
          "Location is required for this feature. Please enable it in settings.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings(); // Built-in function to open device settings
            },
            child: const Text("Open Settings"),
          ),
        ],
      ),
    );
  }
}