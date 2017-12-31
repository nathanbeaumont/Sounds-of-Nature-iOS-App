import Foundation

enum SeasonIndex: Int {
  case spring
  case summer
  case fall
  case winter
  
  func convertToStringTitle() -> String {
    switch self {
    case .spring: return "Spring"
    case .summer: return "Summer"
    case .fall: return "Fall"
    case .winter: return "Winter"
    }
  }
}
