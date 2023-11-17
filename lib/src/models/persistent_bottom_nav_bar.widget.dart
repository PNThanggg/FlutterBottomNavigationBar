part of persistent_bottom_nav_bar;

class PersistentBottomNavBar extends StatelessWidget {
  const PersistentBottomNavBar({
    final Key? key,
    this.margin,
    this.confineToSafeArea,
    this.customNavBarWidget,
    this.hideNavigationBar,
    this.onAnimationComplete,
    this.navBarEssentials,
    this.navBarDecoration,
  }) : super(key: key);

  final NavBarEssentials? navBarEssentials;
  final EdgeInsets? margin;
  final NavBarDecoration? navBarDecoration;
  final Widget? customNavBarWidget;
  final bool? confineToSafeArea;
  final bool? hideNavigationBar;
  final Function(bool, bool)? onAnimationComplete;

  Padding _navBarWidget() => Padding(
        padding: margin!,
        child: margin!.bottom > 0
            ? SafeArea(
                top: false,
                bottom: navBarEssentials!.navBarHeight == 0.0 ||
                        (hideNavigationBar ?? false)
                    ? false
                    : confineToSafeArea ?? true,
                child: Container(
                  color: navBarEssentials!.backgroundColor,
                  height: navBarEssentials!.navBarHeight,
                  child: customNavBarWidget,
                ),
              )
            : Container(
                color: navBarEssentials!.backgroundColor,
                child: SafeArea(
                    top: false,
                    bottom: navBarEssentials!.navBarHeight == 0.0 ||
                            (hideNavigationBar ?? false)
                        ? false
                        : confineToSafeArea ?? true,
                    child: SizedBox(
                        height: navBarEssentials!.navBarHeight,
                        child: customNavBarWidget)),
              ),
      );

  @override
  Widget build(final BuildContext context) => hideNavigationBar == null
      ? _navBarWidget()
      : OffsetAnimation(
          hideNavigationBar: hideNavigationBar,
          navBarHeight: navBarEssentials!.navBarHeight,
          onAnimationComplete: (final isAnimating, final isComplete) {
            onAnimationComplete!(isAnimating, isComplete);
          },
          child: _navBarWidget(),
        );

  PersistentBottomNavBar copyWith({
    final int? selectedIndex,
    final double? iconSize,
    final int? previousIndex,
    final Color? backgroundColor,
    final Duration? animationDuration,
    final List<PersistentBottomNavBarItem>? items,
    final ValueChanged<int>? onItemSelected,
    final double? navBarHeight,
    final EdgeInsets? margin,
    final double? horizontalPadding,
    final Widget? customNavBarWidget,
    final Function(int)? popAllScreensForTheSelectedTab,
    final bool? popScreensOnTapOfSelectedTab,
    final NavBarDecoration? navBarDecoration,
    final NavBarEssentials? navBarEssentials,
    final bool? confineToSafeArea,
    final ItemAnimationProperties? itemAnimationProperties,
    final Function? onAnimationComplete,
    final bool? hideNavigationBar,
    final bool? isCustomWidget,
    final EdgeInsets? padding,
  }) =>
      PersistentBottomNavBar(
          confineToSafeArea: confineToSafeArea ?? this.confineToSafeArea,
          margin: margin ?? this.margin,
          hideNavigationBar: hideNavigationBar ?? this.hideNavigationBar,
          customNavBarWidget: customNavBarWidget ?? this.customNavBarWidget,
          onAnimationComplete:
              onAnimationComplete as dynamic Function(bool, bool)? ??
                  this.onAnimationComplete,
          navBarEssentials: navBarEssentials ?? this.navBarEssentials,
          navBarDecoration: navBarDecoration ?? this.navBarDecoration);

  bool opaque(final int? index) => navBarEssentials!.items == null
      ? true
      : !(navBarEssentials!.items![index!].opacity < 1.0);

  Widget getNavBarStyle() {
    return BottomNavStyle(
      navBarEssentials: navBarEssentials,
    );
  }
}
