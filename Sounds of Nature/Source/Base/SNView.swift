import Foundation
import UIKit

class SNView: UIView {
  
  @IBOutlet var contentView: UIView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    commonInit()
  }
  
  func commonInit() {
    Bundle.main.loadNibNamed(self.className, owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
  }
}
