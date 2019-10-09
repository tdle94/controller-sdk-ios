//
//  Copyright © 2017 Aromajoin. All rights reserved.
//

import UIKit
import AromaShooterControllerSwift
import CoreBluetooth

class ViewController: UIViewController {
  let aromaShooterController = AromaShooterController.sharedInstance
  
  override func viewDidLoad() {
    aromaShooterController.delegate = self
  }
  
  @IBAction func diffuseAroma(_ sender: UIButton) {
    // Work for both AS1 and AS2
    aromaShooterController.diffuseAll(duration: 1000, booster: true, ports: [1,2,3])

    // Only for AS2. Where each catridge port has its own intensity. As oppose to AS1, which does not have intensity
    aromaShooterController.diffuseAll(durationInMilli: 1000, boosterIntensity: 0, fanIntensity: 50, ports: [CartridgePort(number: 3, intensityPercent: 100)])
  }
  
  @IBAction func stopDiffusing(_ sender: UIButton) {
    aromaShooterController.stopAll()
  }
  
  @IBAction func openConnectionScreen(_ sender: Any) {
    let connectionVC = aromaShooterController.getConnectionViewController()
    if let connectionVC = connectionVC {
      self.navigationController?.pushViewController(connectionVC, animated: true)
    }
  }
}

extension ViewController: AromaShooterDelegate {
  func aromaShooter(didDiscoverDevice device: AromaShooter) {

  }
  
  func aromaShooter(didConnectDevice device: AromaShooter) {

  }
  
  func aromaShooter(didDisconnectDevice device: AromaShooter) {
  
  }
}

