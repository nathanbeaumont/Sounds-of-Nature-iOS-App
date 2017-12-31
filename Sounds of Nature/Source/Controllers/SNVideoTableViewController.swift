import UIKit

class SNVideoTableViewController: UIViewController {

  let season: SeasonIndex
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  // MARK: Object Lifecyle
  
  init(WithSeason season: SeasonIndex) {
    self.season = season
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: View Controller Methods
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.title = season.convertToStringTitle()
    let attributes = [NSAttributedStringKey.font: UIFont.sn_defaultFontWith(Size: 24.0),
                      NSAttributedStringKey.foregroundColor: UIColor.white]
    self.navigationController?.navigationBar.titleTextAttributes = attributes
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    self.navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationController?.navigationBar.isTranslucent = false
    UINavigationBar.appearance().tintColor = UIColor.sn_greenBarTintColor()
    self.navigationController?.navigationBar.barTintColor = UIColor.sn_greenBarTintColor()
    self.navigationController?.navigationBar.tintColor = UIColor.white
  }
}
