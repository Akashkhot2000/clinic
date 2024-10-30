import 'package:clinic/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class common_app_bar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  final Function(String)? onSearchChanged;
  final String? icon_commonappbar;
  final String? title_commonappbar;
  final bool? showSearchBar;
  final int? currentindex;

  common_app_bar({
    this.currentindex,
    this.icon_commonappbar,
    this.title_commonappbar,
    required this.showSearchBar,
    this.onSearchChanged,
  });

  @override
  State<common_app_bar> createState() => _common_app_barState();
}

class _common_app_barState extends State<common_app_bar> {
  TextEditingController _searchController = TextEditingController();
  bool _showClearIcon = false;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _showClearIcon = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 35,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: SvgPicture.asset(
            widget.icon_commonappbar!,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _isSearching && widget.currentindex == 1
              ? Expanded(child: buildSearchBar())
              : Text(
                  widget.title_commonappbar!,
                  style: TextStyle(
                    color: Color(0xFF1A203D),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ],
      ),
      actions: widget.showSearchBar == false
          ? []
          : [
              Padding(
                padding: EdgeInsets.only(right: 3.w),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSearching = !_isSearching;
                      // if (!_isSearching && widget.currentindex == 0) {
                      _searchController.clear();
                      // }
                      widget.onSearchChanged!('');
                    });
                  },
                  child: _isSearching
                      ? Icon(Icons.close)
                      : SvgPicture.asset(
                          'assets/icons/search-normal.svg',
                        ),
                ),
              ),
            ],
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: EdgeInsets.only(left: 2.w),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            color: Color(0xFFF6F9F9),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search here.. ',
              border: InputBorder.none,
            ),
            onChanged: (value) {
              widget.onSearchChanged!(value);
            },
          ),
        ),
      ),
    );
  }
}
