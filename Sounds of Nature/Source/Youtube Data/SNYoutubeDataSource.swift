import Foundation

struct SNYoutubeDataSource {
  private let fallVideoIds: [String] = ["nn3wvAN15Ys", "IadsLclBOS8", "w0szAwgybZs",
                                        "6uhRxK_EOm4", "bZIjuGlIA2U"]
  private let springVideoIds: [String] = ["R3AKlscrjmQ", "L6JG_L-PWMA", "1t7g690boao",
                                          "6TwkVs6nhoY", "H1iboKia3AQ", "NK2_bcQcoD4",
                                          "2eAdXwZjHNA", "THnQTYqoDzg", "fW-mixqTTwE"]
  private var seasonIndex: SeasonIndex
  private let summerVideoIds: [String] = ["QhLMlA3Wb8w", "XxP8kxUn5bc", "4himVgExTDM",
                                          "dmMhCcWS9fE", "Ftm2uv7-Ybw", "A2_yg19Pu7Y",
                                          "VtvBpcyQP9M", "HbwhE-I9Kdc"]
  private let winterVideoIds: [String] = ["CUaybv1jdHw", "smMBhPHCsiU", "2pmgu6Yfbb8",
                                          "NZlfxWMr7nc", "0fHaQdacCmM", "0EY28tdiFlc",
                                          "Ux8xAuQBdkk", "eS2ssUROF5o", "gbrkMDkHRqc"]
  
  
  var videoIds: [String] {
    switch seasonIndex {
    case .fall:
      return fallVideoIds
    case .spring:
      return springVideoIds
    case .summer:
      return summerVideoIds
    case .winter:
      return winterVideoIds
    }
  }
  
  init(WithSeason season: SeasonIndex) {
    seasonIndex = season
  }
}
