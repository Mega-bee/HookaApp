import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooka/profile/request/update_profile_request.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../../utils/style/colors.dart';
import 'dart:io' as i;
import '../../../../../utils/components/picker.dart';
import '../../../abstracts/states/state.dart';
import '../../request/add_education_request.dart';
import '../../request/add_experience_request.dart';
import '../../response/profile_response.dart';
import '../../state_manager/edit_profile_state_manger.dart';
import '../../state_manager/profile_state_manager.dart';
import '../state/edit_init_state.dart';

@injectable
class EditProfile extends StatefulWidget {
  final GetEditProfileCubit cubit;

  EditProfile(this.cubit);
  @override
  final name = TextEditingController();
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  late AsyncSnapshot loadingSnapshot;
  AddEdd(AddEducationRequest request) {
    widget.cubit.AddEducation(
      this,
      request,
    );
  }

  AddExp(AddExperienceRequest request) {
    widget.cubit.AddExperience(
      this,
      request,
    );
  }

  ProfileResponse? mod;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  bool flags = true;

  @override
  void initState() {
    super.initState();
    loadingSnapshot = AsyncSnapshot.nothing();
    widget.cubit.loadingStream.listen((event) {
      if (mounted) {
        setState(() {
          loadingSnapshot = event;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (flags) {
      var args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is ProfileResponse) {
        mod = args;
      }
      flags = false;
      widget.cubit.emit(EditInitState(this, mod));
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Primarycolor,
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "Edit Account",
            style: TextStyle(color: Primarycolor),
          ),
        ),
        body: BlocBuilder<GetEditProfileCubit, States>(
            bloc: widget.cubit,
            builder: (context, state) {
              return state.getUI(context);
            }));
  }
}
