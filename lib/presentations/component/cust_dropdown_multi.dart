import 'package:flutter/material.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/presentations/component/component.dart';

class CustDropDownMulti<T> extends StatefulWidget {
  final List<CustDropdownMenuItemMulti> items;
  final Function onChanged;
  final String hintText;
  final double borderRadius;
  final double maxListHeight;
  final double borderWidth;
  final int defaultSelectedIndex;
  final bool enabled;
  final IconData? icons;

  const CustDropDownMulti({
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

class _CustDropDownState extends State<CustDropDownMulti> with WidgetsBindingObserver {
  bool _isOpen = false, _isAnyItemSelected = false, _isReverse = false;
  OverlayEntry? _overlayEntry;
  RenderBox? _renderBox;
  CustDropdownMenuItemMulti? _itemSelected;
  Offset? dropDownOffset;
  final LayerLink _layerLink = LayerLink();
  TextEditingController? _searchController;
  List<CustDropdownMenuItemMulti> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          dropDownOffset = getOffset();
          _filteredItems = widget.items;
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
    _searchController?.addListener(_filterItems);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _searchController?.removeListener(_filterItems);
    _searchController?.dispose();
    _searchController = null;
    super.dispose();
  }

  void _filterItems() {
    if (mounted) {
      setState(() {
        _filteredItems = widget.items.where((item) => item.title.toLowerCase().contains(_searchController!.text.toLowerCase())).toList();
      });
    }
  }

  void _addOverlay() {
    if (mounted) {
      setState(() {
        _isOpen = true;
      });
    }

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (mounted) {
      setState(() {
        _isOpen = false;
      });
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
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
          offset: dropDownOffset!,
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
                      offset: const Offset(0, 1),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: ColorPalette.greyBackground,
                            ),
                            onChanged: (text) => _filterItems(),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: widget.maxListHeight,
                          ),
                          child: _filteredItems.isEmpty
                              ? Center(child: Text('No results found'))
                              : ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  children: _filteredItems
                                      .map(
                                        (item) => GestureDetector(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Component.textDefault(item.title, colors: ColorPalette.blackText, fontSize: 13),
                                          ),
                                          onTap: () {
                                            if (mounted) {
                                              setState(() {
                                                _isAnyItemSelected = true;
                                                _itemSelected = item;
                                                _removeOverlay();
                                                widget.onChanged(_itemSelected);
                                              });
                                            }
                                          },
                                        ),
                                      )
                                      .toList(),
                                ),
                        ),
                      ],
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
      return Offset(0, renderBox.size.height - (widget.maxListHeight + renderBox.size.height));
    }
  }

  double _getAvailableSpace(double offsetY) {
    double safePaddingTop = MediaQuery.of(context).padding.top;
    double safePaddingBottom = MediaQuery.of(context).padding.bottom;

    double screenHeight = MediaQuery.of(context).size.height - safePaddingBottom - safePaddingTop;

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
                      child: Component.textDefault(_itemSelected?.title ?? "", colors: ColorPalette.blackText, fontSize: 13),
                    )
                  : Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          widget.hintText,
                          style: TextStyle(color: ColorPalette.textGrey, fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
              const Spacer(),
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
      return BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)));
    } else {
      return null;
    }
  }
}

class CustDropdownMenuItemMulti {
  final String key;
  final String title;

  const CustDropdownMenuItemMulti({required this.key, required this.title});
}
