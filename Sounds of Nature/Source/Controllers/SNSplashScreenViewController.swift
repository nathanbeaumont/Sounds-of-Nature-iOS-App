import QuartzCore
import UIKit

enum TimeOfDay: Int {
  case dawn
  case morning
  case afternoon
  case dusk
  case night
}

class SNSplashScreenViewController: UIViewController {

  @IBOutlet weak var splashImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  
  let animationDelay = 1.0
  let animationDuration = 2.0
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  // MARK: View Controller methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    splashImageView.image = imageToPresent()
    splashImageView.contentMode = .scaleAspectFill
    titleLabel.layer.opacity = 0.0
    titleLabel.text = NSLocalizedString("splash_title", comment: "")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    self.perform(#selector(showTitleLabelWithAnimation), with: nil, afterDelay: animationDelay)
    self.perform(#selector(presentHomeViewController), with: nil, afterDelay: animationDelay + animationDuration)
  }

  // MARK: Private Methods
  
  @objc private func presentHomeViewController() {
    self.navigationController?.present(SNHomeTableViewController(), animated: true, completion: nil)
  }
  
  @objc private func showTitleLabelWithAnimation() {
    let animation = CABasicAnimation(keyPath: "opacity")
    animation.fromValue = 0.0
    animation.toValue = 1.0
    animation.duration = animationDuration
    self.titleLabel.layer.add(animation, forKey: "opacity")
    self.titleLabel.layer.opacity = 1.0
  }
  
  func currentTimeOfDay() -> TimeOfDay {
    let date = Date()
    let hourOfDay = Calendar.current.component(.hour, from: date)
    
    switch hourOfDay {
    case _ where 5 <= hourOfDay && hourOfDay < 9 :
      return .dawn
    case _ where 9 <= hourOfDay && hourOfDay < 13:
      return .morning
    case _ where 13 <= hourOfDay && hourOfDay < 17:
      return .afternoon
    case _ where 17 <= hourOfDay && hourOfDay < 20:
      return .dusk
    default:
      return .night
    }
  }
  
  func imageToPresent() -> UIImage {
    switch currentTimeOfDay() {
    case .dawn:
      return #imageLiteral(resourceName: "dawn-splash")
    case .morning:
      return #imageLiteral(resourceName: "morning-splash")
    case .afternoon:
      return #imageLiteral(resourceName: "afternoon-splash")
    case .dusk:
      return #imageLiteral(resourceName: "dusk-splash")
    case .night:
      return #imageLiteral(resourceName: "night-splash")
    }
  }
  
}
