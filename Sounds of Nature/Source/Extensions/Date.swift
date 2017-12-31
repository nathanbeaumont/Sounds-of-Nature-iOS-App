import Foundation

extension Date {
  static func dateFromCurrentTimeZone() -> Date {
    let date = Date()
    let secondsFromUTCTime = TimeZone.current.secondsFromGMT(for: date) as NSNumber
    
    return Date.init(timeInterval: secondsFromUTCTime.doubleValue, since: date)
  }
}
