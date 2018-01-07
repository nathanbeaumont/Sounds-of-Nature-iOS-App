import Foundation

extension NSObject {

  var className: String {
    return type(of: self).description()
  }
}
