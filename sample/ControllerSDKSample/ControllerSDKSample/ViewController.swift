//
//  Copyright © 2017 Aromajoin. All rights reserved.
//

import UIKit
import AromaShooterControllerSwift
import CoreBluetooth

class ViewController: UIViewController {
  let aromaShooterController = AromaShooterController.sharedInstance
  
  @IBAction func diffuseAroma(_ sender: UIButton) {
    // Work for both AS1 and AS2
    aromaShooterController.diffuseAll(duration: 1000, booster: true, ports: [1,2,3])

    // Only for AS2
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

