import 'package:clinic/Common_Widget/common_app_bar.dart';
import 'package:clinic/Common_Widget/customTextField.dart';
import 'package:clinic/Common_Widget/customdropdpwn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? _selectedState;

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();

  final Map<String, List<String>> stateMap = {
    'India': ['Maharastra', 'karnatak', 'keral', 'Goa'],
    'Pak': ['Punjab', 'Sindh', 'Balochistan', 'Khyber Pakhtunkhwa'],
    'Aus': ['New South Wales', 'Victoria', 'Queensland', 'Western Australia'],
    'America': ['California', 'Texas', 'Florida', 'New York'],
  };

  final List<String>? cityList = [
    'Pune',
    'Kolhapur',
    'Satara',
    'Sangali',
  ];
  final TextEditingController _selectedCountryController =
      TextEditingController();
  final TextEditingController _selectedStateController =
      TextEditingController();
  final TextEditingController _selectedCityController = TextEditingController();
  void updateStates(String selectedCountry) {
    setState(() {
      _selectedCountryController.text = selectedCountry;
      if (stateMap.containsKey(selectedCountry)) {
        List<String>? states = stateMap[selectedCountry];
        _selectedState = states?.isNotEmpty == true ? states![0] : null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: common_app_bar(
          icon_commonappbar: 'assets/icons/a.svg',
          title_commonappbar: 'Profile',
          showSearchBar: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(2.h),
                  width: 148.58,
                  height: 148.58,
                  child: Container(
                      width: 118.34,
                      height: 118.34,
                      decoration: ShapeDecoration(
                          color: Colors.black12, shape: OvalBorder()),
                      child: SvgPicture.asset(
                        'assets/icons/pr.svg',
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                    right: 5,
                    bottom: 5,
                    child: SvgPicture.asset('assets/icons/edit.svg')),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 45.w,
                  child: CustomTextField(
                    label: 'First Name',
                    hintText: 'First name',
                    controller: _firstnameController,
                  ),
                ),
                SizedBox(
                  width: 2.h,
                ),
                Container(
                  width: 45.w,
                  child: CustomTextField(
                    label: 'Last Name',
                    hintText: 'Last name',
                    controller: _lastnameController,
                  ),
                ),
              ],
            ),
            Container(
              width: 95.w,
              child: CustomTextField(
                label: 'Email',
                hintText: 'Email',
                controller: _emailController,
              ),
            ),
            Container(
              width: 95.w,
              child: CustomTextField(
                label: 'Username',
                hintText: 'Username',
                controller: _usernameController,
              ),
            ),
            Container(
              width: 100.w,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFE7E7E7),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            SizedBox(
              width: 340.w,
              child: Padding(
                padding: EdgeInsets.only(left: 3.w, top: 1.h, bottom: 1.h),
                child: Text(
                  'Address',
                  style: TextStyle(
                    color: Color(0xFF1A203D),
                    fontSize: 18.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              width: 95.w,
              child: CustomTextField(
                label: 'Address Line 1',
                hintText: 'House no, Locality',
                controller: _address1Controller,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              width: 95.w,
              child: CustomTextField(
                label: 'Address Line 2',
                hintText: 'Area, town, city',
                controller: _address2Controller,
              ),
            ),
            Container(
              width: 95.w,
              child: CustomDropdown(
                items: stateMap.keys.toList(),
                onItemSelected: (selectedValue) {
                  setState(() {
                    _selectedCountryController.text = selectedValue;
                  });
                  updateStates(selectedValue);
                },
                title: 'Country',
                label: 'Select country ',
                All_country_state: '',
                stateMap: stateMap,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            // Text(
            //   'Selected State: $_selectedState',
            //   style: TextStyle(
            //     color: Color(0xFF1A203D),
            //     fontSize: 16.sp,
            //     fontFamily: 'Poppins',
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
            Container(
              width: 95.w,
              child: CustomDropdown(
                items: stateMap[_selectedCountryController.text] ?? [],
                onItemSelected: (selectedValue) {
                  setState(() {
                    _selectedState = selectedValue;
                    _selectedStateController.text = selectedValue;
                  });
                },
                title: 'State',
                label: 'Select state ',
                All_country_state: '',
                stateMap: stateMap,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 95.w,
              child: CustomDropdown(
                onItemSelected: (selectedValue) {
                  setState(() {
                    _selectedCityController.text = selectedValue;
                  });
                },
                items: cityList,
                title: 'City',
                label: 'Select City',
                All_country_state: '',
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 95.w,
              child: CustomTextField(
                label: 'ZIP Code',
                hintText: 'e.g 100012',
                controller: _usernameController,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: InkWell(
        onTap: () {
          if (validateForm()) {
            _firstnameController.clear();
            _lastnameController.clear();
            _emailController.clear();
            _usernameController.clear();
            _address1Controller.clear();
            _address2Controller.clear();
            _selectedCountryController.clear();
            _selectedStateController.clear();
            _selectedCityController.clear();
            showSuccessMessage('update operastion successfully');
          }
        },
        child: Container(
          width: 349,
          height: 60,
          decoration: ShapeDecoration(
            color: Color(0xFF01A750),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Center(
            child: Text(
              'Update',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
      )),
    );
  }

  bool validateForm() {
    if (_firstnameController.text.isEmpty) {
      // Show an error message for the first name field
      // You can use a snackbar, dialog, or any other method to display the error message
      showErrorMessage('Please Enter First name');
      return false;
    }

    if (_lastnameController.text.isEmpty) {
      // Show an error message for the last name field
      showErrorMessage('Please Enter Last name');
      return false;
    }

    if (_emailController.text.isEmpty) {
      // Show an error message for the email field
      showErrorMessage('Please Enter Email');
      return false;
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(_emailController.text)) {
      showErrorMessage('Invalid Email Format');
      return false;
    }

    if (_usernameController.text.isEmpty) {
      // Show an error message for the username field
      showErrorMessage('Please Enter Username');
      return false;
    }

    if (_address1Controller.text.isEmpty) {
      // Show an error message for the address 1 field
      showErrorMessage('Please Enter Address Line 1');
      return false;
    }

    if (_address2Controller.text.isEmpty) {
      // Show an error message for the address 2 field
      showErrorMessage('Please Enter Address Line 2');
      return false;
    }

    if (_selectedCountryController.text.isEmpty) {
      // Show an error message for the country dropdown
      showErrorMessage('Please Select Country');
      return false;
    }

    if (_selectedStateController.text.isEmpty) {
      // Show an error message for the state dropdown
      showErrorMessage('Please Select State');
      return false;
    }

    if (_selectedCityController.text.isEmpty) {
      // Show an error message for the city dropdown
      showErrorMessage('Please Select City');
      return false;
    }

    // Add more validations as needed

    // If all validations pass, return true
    return true;
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void showSuccessMessage(String messages) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(messages),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
