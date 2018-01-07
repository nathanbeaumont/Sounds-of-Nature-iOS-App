import UIKit
import youtube_ios_player_helper

class SNVideoTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let season: SeasonIndex
  let dataSourece: SNYoutubeDataSource
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  // MARK: Object Lifecyle
  
  init(WithSeason season: SeasonIndex) {
    self.season = season
    self.dataSourece = SNYoutubeDataSource(WithSeason: self.season)
    
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
    
    let nib = UINib(nibName: SNVideoCell.description(), bundle: .main)
    self.tableView.register(nib, forCellReuseIdentifier: SNVideoCell.description())
    self.tableView.dataSource = self
    self.tableView.delegate = self
  }
}

extension SNVideoTableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSourece.videoIds.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: SNVideoCell! = tableView.dequeueReusableCell(withIdentifier: SNVideoCell.description()) as? SNVideoCell
    cell?.configureWithVideoId(id: dataSourece.videoIds[indexPath.row])
    cell?.tableView = tableView
    
    return cell
  }
}

extension SNVideoTableViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100.0
  }
}
