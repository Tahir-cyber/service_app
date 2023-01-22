// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:service_app/Feature/CustomerProflieScreens/LocationScreen/LocationScreen.dart';
import '../../../Backend/core/Enums/enums.dart';
import '../../CustomerProflieScreens/ShopDetailScreen.dart/Shopdetaildata.dart';
import '../BusinessSignUpScreen/BusinessSignUpProvider.dart';

class BusinessUploadFileScreen extends StatefulWidget {
  BusinessUploadFileScreen({Key? key}) : super(key: key);

  @override
  State<BusinessUploadFileScreen> createState() =>
      _BusinessUploadFileScreenState();
}

class _BusinessUploadFileScreenState extends State<BusinessUploadFileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  String? _fileName;
  PlatformFile? _fileName2;
  FilePickerResult? resultvar;
  String? _saveAsFileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _isLoading = false;
  bool _userAborted = false;
  final _multiPick = true;
  final _pickingType = FileType.any;
  // TextEditingController _controller = TextEditingController();

  @override
  // void initState() {
  //   super.initState();
  //   _controller.addListener(() => _extension = _controller.text);
  // }

  void _resetState() {
    if (!mounted) {
      return;
    }
    setState(() {
      _isLoading = true;
      _directoryPath = null;
      _fileName = null;
      _paths = null;
      _saveAsFileName = null;
      _userAborted = false;
    });
  }

  void _logException(String message) {
    print(message);
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  List<String?>? name;

  _pickFiles() async {
    _resetState();
    try {
      _directoryPath = null;

      _paths = (await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowMultiple: _multiPick,
              onFileLoading: (FilePickerStatus status) => print(status),
              allowedExtensions: ["pdf", "svg", "png", "jpeg", "jpg"]
              // (_extension?.isNotEmpty ?? false)
              //     ? _extension?.replaceAll(' ', '').split(',')
              //     : null,

              ))
          ?.files;

      name = _paths!.map((e) => e.path).toList();

      Provider.of<BusinessSignUpProvider>(context, listen: false).docFileList =
          name;

      // ignore: use_build_context_synchronously
      await Provider.of<BusinessSignUpProvider>(context, listen: false)
          .uploadDocfile();
    } on PlatformException catch (e) {
      _logException('Unsupported operation$e');
    } catch (e) {
      _logException(e.toString());
    }
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
      _userAborted = _paths == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BusinessSignUpProvider(),
      child: Consumer<BusinessSignUpProvider>(
        builder: (context, model, child) {
          return ModalProgressHUD(
              inAsyncCall: model.state == ViewState.busy,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: lightgrey,
                  body: SingleChildScrollView(
                      child: commonPadding(
                          data: Column(
                    children: [
                      Text_widget(
                        name: "Upload Files",
                        text_size: 22,
                      ),
                      Text_widget(
                        name: "Kindly Upload the following Documents",
                        text_size: 17,
                      ),
                      fixsize,
                      Container(
                        height: 170.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: lightgreen,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              images.uploadGreen,
                              scale: 3.0,
                            ),
                            minmium,
                            Text_widget(
                              name: "Upload Documents",
                              state: 2,
                              Text_color: baseColor,
                              text_size: 17,
                            ),
                            minmium,
                            InkWell(
                              onTap: () async {
                                await _pickFiles();

                                // var mb = _paths![0].size / 1024/1024;

                                // final picksizefile = mb;
                                // log("this is new ${_fileName2!.size}");
                                // log("this is other $picksizefile");
                                // Get.to(FilePickerDemo());
                              },
                              child: custom_Card(
                                  data: Text_widget(
                                    name: "Browse Files",
                                    state: 2,
                                    text_size: 15,
                                    Text_color: white,
                                  ),
                                  color: baseColor,
                                  radius: 24.r,
                                  state: 4),
                            )
                          ],
                        )),
                      ),
                      fixsize,
                      SizedBox(
                        height: Get.height / 2.4,
                        child: Builder(
                          builder: (BuildContext context) => _isLoading
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CircularProgressIndicator(
                                        color: baseColor,
                                        strokeWidth: 5,
                                      ),
                                      minmium,
                                      Text_widget(
                                        name: "Doc Uploading...",
                                        text_size: 17,
                                      )
                                    ],
                                  )),
                                )
                              : _userAborted
                                  ? const Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        'User has aborted the dialog',
                                      ),
                                    )
                                  : _directoryPath != null
                                      ? ListTile(
                                          title: const Text('Directory path'),
                                          subtitle: Text(_directoryPath!),
                                        )
                                      : _paths != null
                                          ? Scrollbar(
                                              child: ListView.separated(
                                              // shrinkWrap: true,
                                              // physics:
                                              //     NeverScrollableScrollPhysics(),
                                              itemCount: _paths != null &&
                                                      _paths!.isNotEmpty
                                                  ? _paths!.length
                                                  : 1,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                var byte = _paths![index].size;

                                                var kb = byte / 1024;
                                                var mb = kb / 1024;
                                                final bool isMultiPath =
                                                    _paths != null &&
                                                        _paths!.isNotEmpty;
                                                // model.docFile =
                                                final String name = isMultiPath
                                                    ? _paths!
                                                        .map((e) => e.name)
                                                        .toList()[index]
                                                    : _fileName ?? '...';
                                                final path = kIsWeb
                                                    ? null
                                                    : _paths!
                                                        .map((e) => e.path)
                                                        .toList()[index]
                                                        .toString();

                                                return InkWell(
                                                    onTap: () {
                                                      // model.docurlList[0];
                                                      // log("${model.docurlList[0].toString()}");
                                                    },
                                                    child: pdf_file_list(
                                                      title: name,
                                                      size:
                                                          mb.toStringAsFixed(2),
                                                      // model
                                                      //     .imageMBsize[index],
                                                    )

                                                    // ListTile(
                                                    //   title: Text(
                                                    //     name,
                                                    //   ),
                                                    //   subtitle: Text(path ?? ''),
                                                    // ),
                                                    );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      const Divider(),
                                            ))
                                          : _saveAsFileName != null
                                              ? ListTile(
                                                  title:
                                                      const Text('Save file'),
                                                  subtitle:
                                                      Text(_saveAsFileName!),
                                                )
                                              : const SizedBox(),
                        ),
                      ),
                      fixsize,
                      fixsize,
                      Custom_button(
                          text: "Next",
                          onpressed: () {
                            if (_paths == null) {
                              popUpMessage(
                                title: "Select file",
                                message: "Please select any bussiness doc file",
                              );
                            } else {
                              Get.to(LocationScreen(
                                state: 2,
                              ));
                            }
                            print("this is new $_paths");
                          }),
                    ],
                  ))),
                ),
              ));
        },
      ),
    );
  }

  Row pdf_file_list({required String title, required String size}) {
    return Row(
      children: [
        Image.asset(
          images.pdfimage,
          scale: 3,
        ),
        fixsizewidth10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 220.w,
              child: Text_widget(
                name: title,
                text_size: 17,
                state: 2,
              ),
            ),
            minmium,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  alignment: MainAxisAlignment.start,
                  barRadius: Radius.circular(10.r),
                  width: 160.0.w,
                  lineHeight: 10.0,
                  percent: 1.0,
                  progressColor: baseColor,
                ),
                minmium_width,
                Text_widget(
                  name: "100%",
                  text_size: 12,
                ),
              ],
            ),
            Text_widget(
              name: "$size MB",
              text_size: 13,
              state: 2,
              Text_color: baseColor,
              text_wight: FontWeight.w500,
            ),
          ],
        )
      ],
    );
  }
}
