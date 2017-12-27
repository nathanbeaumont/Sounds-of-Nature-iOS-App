import UIKit

enum SeasonIndex: Int {
  case Spring
  case Summer
  case Fall
  case Winter
}

@objc(SNSeasonCell)

class SNSeasonCell: UITableViewCell {
  
  @IBOutlet weak var seasonImageView: UIImageView!
  @IBOutlet weak var seasonTitleLabel: UILabel!
  @IBOutlet weak var seasonDescriptionLabel: UILabel!
  
  public func configureForIndex(index: Int) {
    guard let season: SeasonIndex = SeasonIndex(rawValue: index) else {
      return
    }
    var imageName: String

    switch season {
      case .Spring:
        imageName = "spring_cell_image"
        self.seasonTitleLabel.text = NSLocalizedString("spring_cell_title", comment: "")
        self.seasonDescriptionLabel.text = NSLocalizedString("spring_cell_description", comment: "")
      break
      case .Summer:
        imageName = "summer_cell_image"
        self.seasonTitleLabel.text = NSLocalizedString("summer_cell_title", comment: "")
        self.seasonDescriptionLabel.text = NSLocalizedString("summer_cell_description", comment: "")
      break
      case .Fall:
        imageName = "fall_cell_image"
        self.seasonTitleLabel.text = NSLocalizedString("fall_cell_title", comment: "")
        self.seasonDescriptionLabel.text = NSLocalizedString("fall_cell_description", comment: "")
      break
      case .Winter:
        imageName = "winter_cell_image"
        self.seasonTitleLabel.text = NSLocalizedString("winter_cell_title", comment: "")
        self.seasonDescriptionLabel.text = NSLocalizedString("winter_cell_description", comment: "")
      break
    }
    
    let cellImage = UIImage(named: imageName)
    self.seasonImageView.image = cellImage
  }
}
