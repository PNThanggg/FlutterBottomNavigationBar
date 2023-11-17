library persistent_bottom_nav_bar;

import "dart:math";
import "dart:ui";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

//Animations
part 'animations/animations.dart';

part "models/nav_bar_animation.model.dart";
part "models/nav_bar_essentials.model.dart";
part "models/nav_bar_padding.model.dart";
part "models/page_route_transitions.model.dart";
part "models/persistent_bottom_nav_item.widget.dart";
part "models/persistent_bottom_nav_bar_styles.widget.dart";
part "models/persistent_bottom_nav_bar.widget.dart";

//Models
part "models/persistent_nav_bar_scaffold.widget.dart";
part "models/route_settings.model.dart";
part "models/tab_view.widget.dart";

//Styles
part "styles/bottom_nav_bar.widget.dart";

part "paint/paint.dart";

//Main TabView Widget
part "persistent_tab_view.widget.dart";

//Utils
part "utils/functions.utils.dart";
part "utils/navigator_functions.utils.dart";
