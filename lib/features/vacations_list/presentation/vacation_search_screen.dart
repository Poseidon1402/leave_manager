import 'package:flutter/material.dart';

import '../../../core/utils/constants/app_color.dart';
import 'components/employee_on_vacation.dart';

class VacationSearchScreen extends StatelessWidget {
  const VacationSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: AppColor.white1,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const EmployeeOnVacation(
                      name: 'Moussa Diop',
                      reason: 'Malade',
                      from: 'Sam 23',
                      to: 'Mar 26',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.white1,
    );
  }
}