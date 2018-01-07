import UIKit
import youtube_ios_player_helper

@objc(SNVideoCell)

class SNVideoCell: UITableViewCell {
  
  weak var tableView: UITableView?
  var videoPlayer: YTPlayerView
    
  required init?(coder aDecoder: NSCoder) {
    videoPlayer = YTPlayerView()
    
    super.init(coder: aDecoder)
    
    videoPlayer.delegate = self
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    
    videoPlayer.frame = self.contentView.frame
    contentView.addSubview(videoPlayer)
    contentView.backgroundColor = UIColor.black
  }
  
  public func configureWithVideoId(id: String) {
    videoPlayer.load(withVideoId: id)
  }
}

extension SNVideoCell: YTPlayerViewDelegate {
  func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
    videoPlayer.alpha = 0.0
    UIView.animate(withDuration: 1.0) {
      self.videoPlayer.alpha = 1.0
    }
  }
  
  func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
    if let tableView = self.tableView {
      if state == .buffering {
        tableView.isUserInteractionEnabled = false
      } else if state == .playing || state == .paused || state == .ended || state == .unknown {
        tableView.isUserInteractionEnabled = true
      }
    }
    
    if let tableView = self.tableView, state == .buffering {
      tableView.isUserInteractionEnabled = false
    }
  }
  
  func playerViewPreferredInitialLoading(_ playerView: YTPlayerView) -> UIView? {
    let view = UIView()
    view.backgroundColor = UIColor.black
    
    return view
  }
}
