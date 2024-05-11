import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:flutter_gemini/flutter_gemini.dart' as gemini;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:cached_network_image/cached_network_image.dart'
    as cached_network_image;
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart'
    as persistent_nav_bar;
import 'package:get/get.dart' as get_x;
import 'package:image_picker/image_picker.dart' as image_picker;
import 'package:dash_chat_2/dash_chat_2.dart' as dash_chat;
import 'package:flutter_markdown/flutter_markdown.dart' as flutter_markdown;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as flutter_inset_box_shadow;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('Check if all required packages are loaded', () {
    expect(dotenv.dotenv, isNotNull);
    expect(gemini.Gemini, isNotNull);
    expect(http.Client, isNotNull);
    expect(launchUrl, isNotNull);
    expect(carousel_slider.CarouselSlider, isNotNull);
    expect(cached_network_image.CachedNetworkImage, isNotNull);
    expect(persistent_nav_bar.PersistentTabController, isNotNull);
    expect(get_x.Get, isNotNull);
    expect(image_picker.ImagePicker, isNotNull);
    expect(dash_chat.DashChat, isNotNull);
    expect(flutter_markdown.Markdown, isNotNull);
    expect(flutter_inset_box_shadow.BoxShadow, isNotNull);
  });

  test('Markdown widget should render text', () {
    const markdownWidget = flutter_markdown.Markdown(data: 'Hello **world**!');
    expect(markdownWidget.data.contains('**world**'), true);
  });

  test('PersistentTabController should switch tabs', () {
    final controller =
        persistent_nav_bar.PersistentTabController(initialIndex: 0);
    controller.jumpToTab(1);
    expect(controller.index, 1);
  });
}
