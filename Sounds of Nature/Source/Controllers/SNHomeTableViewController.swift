import Foundation
import UIKit

class SNHomeTableViewController: UIViewController {
  
  @IBOutlet weak var bannerView: UIView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var titlelabel: UILabel!
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(nibName: SNSeasonCell.description(), bundle: .main)
    self.tableView.register(nib, forCellReuseIdentifier: SNSeasonCell.description())

    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.tableFooterView = UIView()
  }
}

extension SNHomeTableViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let identifier = SNSeasonCell.description()
    let cell: SNSeasonCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? SNSeasonCell
    cell?.configureForIndex(index: indexPath.row)
    
    return cell
  }
}

extension SNHomeTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 120
    }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath) as? SNSeasonCell
    let videoTableViewController = SNVideoTableViewController(WithSeason: cell?.season ?? .spring)
    
    self.navigationController?.pushViewController(videoTableViewController, animated: true)
  }
}
