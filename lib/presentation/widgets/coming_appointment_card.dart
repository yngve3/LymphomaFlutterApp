import 'package:flutter/material.dart';
import 'package:lymphoma/domain/models/appointment.dart';
import 'package:lymphoma/domain/utils/date_formatter.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/widgets/image_network.dart';

import '../../consts/dimens.dart';

class ComingAppointmentCard extends StatelessWidget {
  const ComingAppointmentCard({
    super.key,
    required this.appointment
  });

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    final doctor = appointment.doctor;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.padding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageNetwork(imageURL: doctor.imageURL, dimension: 96),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(doctor.fullName, style: context.textTheme.titleMedium),
                  Text(
                    "${doctor.type}, каб. ${doctor.room}",
                    style: context.textTheme.bodyMedium
                  ),
                  const SizedBox(height: 27),
                  Text(
                    DateFormatter.getDateInWordAndTime(appointment.dateTime),
                    style: context.textTheme.titleMedium
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
