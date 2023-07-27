import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/domain/entity/pause_entity.dart';
import '../../../core/presentation/bloc/pause/pause_bloc.dart';
import '../../../core/presentation/components/buttons/gradient_button.dart';
import '../../../core/utils/constants/app_color.dart';
import '../../new_request/presentation/bloc/pause_manage_bloc.dart';
import '../../new_request/presentation/components/input.dart';

class PauseDetailScreen extends StatefulWidget {
  final PauseEntity pause;

  const PauseDetailScreen({
    super.key,
    required this.pause,
  });

  @override
  State<PauseDetailScreen> createState() => _PauseDetailScreenState();
}

class _PauseDetailScreenState extends State<PauseDetailScreen> {
  late final TextEditingController _causeController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _fromController;
  late final TextEditingController _endController;
  late final TextEditingController _statusController;

  @override
  void initState() {
    _causeController = TextEditingController(text: widget.pause.reason);
    _descriptionController =
        TextEditingController(text: widget.pause.description);
    _fromController = TextEditingController(
        text: DateFormat('d MMMM yyyy', 'fr_FR').format(widget.pause.from));
    _endController = TextEditingController(
        text: DateFormat('d MMMM yyyy', 'fr_FR').format(widget.pause.to));
    _statusController = TextEditingController(text: widget.pause.status);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: const Color.fromRGBO(84, 84, 84, 1),
            size: 18.sp,
          ),
        ),
      ),
      backgroundColor: AppColor.white1,
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Demander une pause',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 25.h,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: ColoredBox(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: Column(
                          children: [
                            Input(
                              controller: _causeController,
                              label: 'Cause',
                              icon: Icons.grid_view,
                            ),
                            Input(
                              controller: _descriptionController,
                              label: 'Description',
                              icon: Icons.file_copy,
                            ),
                            Input(
                              controller: _fromController,
                              label: 'De',
                              icon: Icons.calendar_today,
                            ),
                            Input(
                              controller: _endController,
                              label: "Jusqu'au",
                              icon: Icons.arrow_back,
                            ),
                            Input(
                              controller: _statusController,
                              label: 'Status',
                              icon: Icons.edit_location_alt_outlined,
                              readOnly: true,
                              showCursor: false,
                              textColor: _causeController.text == 'APPROUVE'
                                  ? AppColor.green1
                                  : AppColor.red1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              FractionallySizedBox(
                widthFactor: 1,
                child: GradientButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColor.green1,
                        content: Text(
                          'Votre demande a été modifiée',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                  text: 'MODIFIER LA DEMANDE',
                  fixedHeight: 46.h,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  colors: const [
                    AppColor.blue2,
                    AppColor.blue1,
                  ],
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: GradientButton(
                  onPressed: () {
                    context
                        .read<PauseManageBloc>()
                        .add(PauseDeleteEvent(id: widget.pause.id!));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColor.red1,
                        content: Text(
                          'Votre demande a été supprimée',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                    context.read<PauseBloc>().add(PauseFetchingEvent());
                    context.pop();
                  },
                  text: 'SUPPRIMER LA DEMANDE',
                  fixedHeight: 46.h,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  colors: const [
                    AppColor.red2,
                    AppColor.red1,
                  ],
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
