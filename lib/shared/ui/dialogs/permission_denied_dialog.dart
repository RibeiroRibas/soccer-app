import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class PermissionDeniedDialog extends StatelessWidget {
  final VoidCallback onCloseDialog;

  const PermissionDeniedDialog({super.key, required this.onCloseDialog});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: const Text(accessMediaLocationDenied),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(thePermissionShouldBeGranted),
            Text(setPermissionGrantedToAccessMediaLocation),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            await openAppSettings();
            onCloseDialog.call();
          },
          style: Theme.of(context).textButtonTheme.style!.copyWith(
              foregroundColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.onSecondary)),
          child: const Text(grantPermission),
        ),
        TextButton(
          onPressed: onCloseDialog,
          style: Theme.of(context).textButtonTheme.style!.copyWith(
              foregroundColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.onSecondary)),
          child: const Text(notPermission),
        ),
      ],
    );
  }
}
