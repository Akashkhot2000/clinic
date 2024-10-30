import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  final String label;
  final List<String>? items;
  final Map<String, List<String>>? stateMap;
  final String? selectedCountry;
  final Function(String)? onItemSelected;
  final String? All_country_state;

  const CustomDropdown(
      {Key? key,
      required this.label,
      required this.title,
      this.items,
      this.onItemSelected,
      this.stateMap,
      this.selectedCountry,
      this.All_country_state})
      : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  TextEditingController _searchController = TextEditingController();
  String? selectedValue;
  int? selectedIndex;
  late List<String> filteredItems = [];
  late List<String> items = [];
  @override
  void initState() {
    super.initState();
    items = widget.items ?? [];
    filteredItems = widget.items ?? [];
  }

  void filterItems(String query) {
    setState(() {
      filteredItems = widget.items!
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  String _capitalizeFirstLetter(String text) {
    if (text == null || text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                  width: 400,
                  height: 600,
                  child: Padding(
                    padding: EdgeInsets.all(3.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select ${widget.title}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child:
                                  SvgPicture.asset('assets/icons/cancel.svg'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          width: 345.19,
                          height: 50.02,
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F9F9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                  right: 1.w,
                                  left: 1.w,
                                  top: 1.5.h,
                                  bottom: 1.5.h,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/search-normal.svg',
                                ),
                              ),
                              hintText: 'Search here',
                              hintStyle: TextStyle(
                                color: Color(0xFF1A203D),
                                fontSize: 17.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              suffixIcon: _searchController.text.isNotEmpty
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _searchController.clear();
                                          filterItems('');
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        });
                                      },
                                      child: Icon(Icons.clear),
                                    )
                                  : null,
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              print(value);
                              setState(
                                () {
                                  filterItems(value);
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                              child: Text(
                                widget.All_country_state!,
                                style: TextStyle(
                                  color: Color(0xFF1A203D),
                                  fontSize: 15.5,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0.09,
                                ),
                              ),
                            ),
                            // SvgPicture.asset('assets/icons/check.svg'),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            // itemCount: widget.items!.length,
                            itemCount: filteredItems.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedValue = filteredItems[index];
                                    selectedIndex = index;
                                  });
                                  widget.onItemSelected
                                      ?.call(filteredItems[index]);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(_capitalizeFirstLetter(
                                          filteredItems[index])),
                                      if (selectedIndex == index)
                                        SvgPicture.asset(
                                            'assets/icons/check.svg')
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Text(
              widget.title,
              style: TextStyle(
                color: Color(0xFF5F6377),
                fontSize: 15.5.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          Container(
            width: 95.w,
            decoration: ShapeDecoration(
              color: Color(0xFFF6F9F9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(0.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        selectedValue ?? widget.label!,
                        style: selectedValue != null
                            ? TextStyle(
                                // color: Color(0xFF999999),
                                fontSize: 15.5.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              )
                            : TextStyle(
                                // Text style when selectedValue is null
                                color: Color(0xFF999999),
                                fontSize: 15.5.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0.09,
                              ),
                      ),
                    )),
                  ),
                  SvgPicture.asset('assets/icons/arrow-down.svg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
