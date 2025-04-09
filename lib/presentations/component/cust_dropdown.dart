import 'package:flutter/material.dart';
import 'package:vespa_app/core/app/color_palette.dart';

import 'component.dart';

class CustDropDown<T> extends StatefulWidget {
  final List<CustDropdownMenuItem> items;
  final Function onChanged;
  final String hintText;
  final double borderRadius;
  final double maxListHeight;
  final double borderWidth;
  final int defaultSelectedIndex;
  final bool enabled;
  final IconData? icons;

  const CustDropDown({
    required this.items,
    required this.onChanged,
    this.hintText = "",
    this.borderRadius = 0,
    this.borderWidth = 1,
    this.maxListHeight = 100,
    this.defaultSelectedIndex = -1,
    Key? key,
    this.enabled = true,
    this.icons,
  }) : super(key: key);

  @override
  _CustDropDownState createState() => _CustDropDownState();
}

class _CustDropDownState extends State<CustDropDown>
    with WidgetsBindingObserver {
  bool _isOpen = false, _isAnyItemSelected = false, _isReverse = false;
  late OverlayEntry _overlayEntry;
  late RenderBox? _renderBox;
  CustDropdownMenuItem? _itemSelected;
  late Offset dropDownOffset;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          dropDownOffset = getOffset();
        });
      }
      if (widget.defaultSelectedIndex > -1) {
        if (widget.defaultSelectedIndex < widget.items.length) {
          if (mounted) {
            setState(() {
              _isAnyItemSelected = true;
              _itemSelected = widget.items[widget.defaultSelectedIndex];
              widget.onChanged(widget.items[widget.defaultSelectedIndex]);
            });
          }
        }
      }
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  void _addOverlay() {
    if (mounted) {
      setState(() {
        _isOpen = true;
      });
    }

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry);
  }

  void _removeOverlay() {
    if (mounted) {
      setState(() {
        _isOpen = false;
      });
      _overlayEntry.remove();
    }
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    _renderBox = context.findRenderObject() as RenderBox?;

    var size = _renderBox!.size;

    dropDownOffset = getOffset();

    return OverlayEntry(
      maintainState: false,
      builder: (context) => Align(
        alignment: Alignment.center,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: dropDownOffset,
          child: SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius),
                  ),
                  child: Material(
                    elevation: 0,
                    shadowColor: Colors.grey,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: widget.items
                          .map(
                            (item) => GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Component.textDefault(item.title,
                                    colors: ColorPalette.blackText,
                                    fontSize: 13),
                              ),
                              onTap: () {
                                if (mounted) {
                                  setState(() {
                                    _isAnyItemSelected = true;
                                    _itemSelected = item;
                                    _removeOverlay();
                                    widget.onChanged(item);
                                  });
                                }
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Offset getOffset() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    double y = renderBox!.localToGlobal(Offset.zero).dy;
    double spaceAvailable = _getAvailableSpace(y + renderBox.size.height);
    if (spaceAvailable > widget.maxListHeight) {
      _isReverse = false;
      return Offset(0, renderBox.size.height);
    } else {
      _isReverse = true;
      return Offset(
          0,
          renderBox.size.height -
              (widget.maxListHeight + renderBox.size.height));
    }
  }

  double _getAvailableSpace(double offsetY) {
    double safePaddingTop = MediaQuery.of(context).padding.top;
    double safePaddingBottom = MediaQuery.of(context).padding.bottom;

    double screenHeight =
        MediaQuery.of(context).size.height - safePaddingBottom - safePaddingTop;

    return screenHeight - offsetY;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: widget.enabled
            ? () {
                _isOpen ? _removeOverlay() : _addOverlay();
              }
            : null,
        child: Container(
          decoration: _getDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 5),
                child: Icon(
                  widget.icons ?? Icons.format_list_bulleted,
                  color: ColorPalette.primary,
                  size: 20,
                ),
              ),
              _isAnyItemSelected
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Component.textDefault(_itemSelected?.title ?? "",
                          colors: ColorPalette.blackText, fontSize: 13),
                    )
                  : Expanded(
                      // This will take available space and push the dropdown to the right
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          widget.hintText,
                          style: TextStyle(
                              color: ColorPalette.textGrey, fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: ColorPalette.blackText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Decoration? _getDecoration() {
    if (_isOpen && !_isReverse) {
      return BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.borderRadius),
          topRight: Radius.circular(
            widget.borderRadius,
          ),
        ),
      );
    } else if (_isOpen && _isReverse) {
      return BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(widget.borderRadius),
          bottomRight: Radius.circular(
            widget.borderRadius,
          ),
        ),
      );
    } else if (!_isOpen) {
      return BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)));
    } else {
      return null;
    }
  }
}

class CustDropdownMenuItem {
  final String key;
  final String title;

  const CustDropdownMenuItem({required this.key, required this.title});
}
