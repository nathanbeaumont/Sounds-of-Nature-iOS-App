import UIKit

@objc(SNSeasonCell)

class SNSeasonCell: UITableViewCell {

  @IBOutlet weak var seasonImageView: UIImageView!
  @IBOutlet weak var seasonTitleLabel: UILabel!
  @IBOutlet weak var seasonDescriptionLabel: UILabel!
  
  var index: Int = 0

  var season: SeasonIndex {
    if let season: SeasonIndex = SeasonIndex(rawValue: index) {
      return season
    }
    
    return .spring
  }
  
  public func configureForIndex(index: Int) {
    self.index = index
    var imageName: String

    switch season {
      case .spring:
        imageName = "spring_cell_image"
        self.seasonTitleLabel.text = NSLocalizedString("spring_cell_title", comment: "")
        self.seasonDescriptionLabel.text = NSLocalizedString("spring_cell_description", comment: "")
      break
      case .summer:
        imageName = "summer_cell_image"
        self.seasonTitleLabel.text = NSLocalizedString("summer_cell_title", comment: "")
        self.seasonDescriptionLabel.text = NSLocalizedString("summer_cell_description", comment: "")
      break
      case .fall:
        imageName = "fall_cell_image"
        self.seasonTitleLabel.text = NSLocalizedString("fall_cell_title", comment: "")
        self.seasonDescriptionLabel.text = NSLocalizedString("fall_cell_description", comment: "")
      break
      case .winter:
        imageName = "winter_cell_image"
        self.seasonTitleLabel.text = NSLocalizedString("winter_cell_title", comment: "")
        self.seasonDescriptionLabel.text = NSLocalizedString("winter_cell_description", comment: "")
      break
    }
    
    let cellImage = UIImage(named: imageName)
    self.seasonImageView.image = cellImage
  }
}
