import Foundation
import UIKit

extension UIColor {
  
  class func colorWithRed(_ red: Int, green: Int, blue: Int) -> UIColor {
    let redScale = CGFloat(red) / 255.0
    let greenScale = CGFloat(green) / 255.0
    let blueScalle = CGFloat(blue) / 255.0
    
    return UIColor(displayP3Red: redScale, green: greenScale, blue: blueScalle, alpha: 1.0)
  }
  
  class func colorWithRed(_ red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
    let redScale = CGFloat(red) / 255.0
    let greenScale = CGFloat(green) / 255.0
    let blueScalle = CGFloat(blue) / 255.0
    
    return UIColor(displayP3Red: redScale, green: greenScale, blue: blueScalle, alpha: alpha)
  }
  
  class func sn_darkGrayLoadingCell() -> UIColor {
    return UIColor.colorWithRed(94, green: 94, blue: 94, alpha: 0.80)
  }
  
  class func sn_greenColor() -> UIColor {
    return UIColor.colorWithRed(58, green: 108, blue: 34)
  }
  
  class func sn_greenBarTintColor() -> UIColor {
    return UIColor.colorWithRed(78, green: 128, blue: 54)
  }
}
