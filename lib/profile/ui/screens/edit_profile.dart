import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/profile/request/add_adress.dart';
import 'package:hooka/profile/request/delete_address_request.dart';
import 'package:hooka/profile/request/delete_education_request.dart';
import 'package:hooka/profile/request/delete_experience_request.dart';
import 'package:hooka/profile/request/update_profile_request.dart';
import 'package:hooka/profile/ui/state/edit_profile/edit_init_state.dart';
import 'package:injectable/injectable.dart';
import '../../../../../utils/style/colors.dart';
import '../../../abstracts/states/state.dart';
import '../../request/add_education_request.dart';
import '../../request/add_experience_request.dart';
import '../../response/profile_response.dart';
import '../../state_manager/edit_profile_state_manger.dart';

@injectable
class EditProfile extends StatefulWidget {
  final GetEditProfileCubit cubit;
  EditProfile(this.cubit);

  @override
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  late AsyncSnapshot loadingSnapshot;
  addEducation(AddEducationRequest request) {
    widget.cubit.AddEducation(
      this,
      request,
    );
  }

  addExp(AddExperienceRequest request) {
    widget.cubit.AddExperience(
      this,
      request,
    );
  }
  addAddress(AddAddressRequest request) {
    widget.cubit.AddAddressssss(
      this,
      request,
    );
  }
  deleteAddresss(DeleteAddressRequest request) {
    widget.cubit.DeleteAddressssss(
      this,
      request,
    );
  }
 deleteEducation(DeleteEducationRequest request) {
    widget.cubit.DeleteEducationnn(
      this,
      request,
    );
  }
  deleteExperience(DeleteExperienceRequest request) {
    widget.cubit.DeleteExperience(
      this,
      request,
    );
  }
  UpdateProfileee(UpdateProfileRequest request) {
    widget.cubit.UpdateProfile(
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
              style: GoogleFonts.comfortaa(color: Primarycolor,fontWeight: FontWeight.bold)
          ),
        ),
        body: BlocBuilder<GetEditProfileCubit, States>(
            bloc: widget.cubit,
            builder: (context, state) {
              return state.getUI(context);
            }));
  }
}
