import UIKit

@objc(SNAppInfoView)

class SNAppInfoView: SNView {

  @IBOutlet weak var versionLabel: UILabel!
  @IBOutlet weak var feedbackTextView: UITextView!
  
  private let emailURL = URL(string: "mailto:\(NSLocalizedString("feedback_email", comment: ""))")
  
  override func layoutSubviews() {
    superview?.layoutSubviews()
    
    feedbackTextView.delegate = self

    let feedbackEmail = NSLocalizedString("feedback_email", comment: "")
    let feedbackDescription = NSLocalizedString("feedback_description", comment: "")
    let attributedText = NSMutableAttributedString(string: feedbackDescription + feedbackEmail)
    attributedText.addAttribute(.link,
                                value: feedbackEmail,
                                range: NSRange(location: feedbackDescription.count, length: feedbackEmail.count))
    attributedText.addAttribute(.font,
                                value: UIFont(name: "Optima", size: 17.0)!,
                                range: NSRange(location: 0, length: attributedText.length))
    let paragraph = NSMutableParagraphStyle()
    paragraph.alignment = .center
    attributedText.addAttribute(.paragraphStyle,
                                value: paragraph,
                                range: NSRange(location: 0, length: attributedText.length))
    feedbackTextView.attributedText = attributedText
    
    let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    versionLabel.text = String(format: NSLocalizedString("version_format", comment: ""), version)
  }
}

extension SNAppInfoView: UITextViewDelegate {
  func textView(_ textView: UITextView, shouldInteractWith URL: URL,
                in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    if let url = emailURL {
      UIApplication.shared.open(url)
    }
    
    return false
  }
}
