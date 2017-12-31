import Foundation
import UIKit

extension UIFont {
  class func sn_defaultFont() -> UIFont {
    return UIFont(name: "Papyrus", size: 17.0)!
  }
  
  class func sn_defaultFontWith(Size size: CGFloat) -> UIFont {
    return UIFont(name: "Papyrus", size: size)!
  }
}
