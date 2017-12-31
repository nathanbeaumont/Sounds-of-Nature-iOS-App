import UIKit

@UIApplicationMain
class SNAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
      launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
      let homeViewController = SNSplashScreenViewController()
      let navigationController = UINavigationController(rootViewController: homeViewController)
      navigationController.isNavigationBarHidden = true
      
      self.window?.rootViewController = navigationController
      self.window?.makeKeyAndVisible()
    
      return true
    }
}

