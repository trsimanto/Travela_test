
import '../values/icons/tr_icons.dart';

enum TrImageEnumsKeys {
  topLogo,

}

String getImage(TrImageEnumsKeys tr) {
  return trIconsImg[tr.name].toString();
}

String getSvg(TrImageEnumsKeys tr) {
  return trIconsSvg[tr.name].toString();
}
