import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../../utils/style/colors.dart';
import 'dart:io' as i;
import '../../../../../utils/components/picker.dart';
import '../../../abstracts/states/state.dart';
import '../../response/profile_response.dart';
import '../../state_manager/profile_state_manager.dart';

@injectable
class EditProfile extends StatefulWidget {
 final  GetProfileCubit cubit;

 EditProfile(this.cubit);
  @override
  final name = TextEditingController();
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  ProfileResponse? mod;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  bool flags=false;

  @override
  void initState() {
    super.initState();
    widget.cubit.getEditProfile(this);

  }
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        title: Text("Edit Account",style: TextStyle(color: Primarycolor),),

      ),
      body: BlocBuilder<GetProfileCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          })

    );
  }
}
