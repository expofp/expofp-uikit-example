import UIKit
import ExpoFpCommon
import ExpoFpFplan

class ViewController: UIViewController {
    var fplanUiView: UIFplanView!
    
    @IBOutlet weak var container: UIView!
    
    @IBAction func selectBooth(_ sender: UIBarButtonItem) {
        self.fplanUiView.selectBooth("305")
    }
    
    @IBAction func selectExhibitor(_ sender: UIBarButtonItem) {
        self.fplanUiView?.selectExhibitor("Aria Style")
    }
    
    @IBAction func setPosition(_ sender: UIBarButtonItem) {
        self.fplanUiView?.setCurrentPosition(BlueDotPoint(x: 45000.00, y: 14000.00), true)
    }
    
    @IBAction func buildRoute(_ sender: UIBarButtonItem) {
        self.fplanUiView.selectRoute(Route(from: "305", to: "339", exceptInaccessible: false))
    }
    
    @IBAction func clear(_ sender: UIBarButtonItem) {
        self.fplanUiView?.clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fplanUiView = UIFplanView()
        fplanUiView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(fplanUiView)
        
        fplanUiView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        fplanUiView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        fplanUiView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        fplanUiView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
        fplanUiView.setOnFpReadyCallback {
            print("[OnFpReady]")
        }
        
        fplanUiView.setOnFpErrorCallback { errorCode, description in
            print("[OnFpError] errorCode=\(errorCode); description=\(description)")
        }
        
        fplanUiView.setOnBoothClickCallback { id, name in
            print("[OnBoothClick] id=\(id); name=\(name)")
        }
        
        fplanUiView.setOnBuildDirectionCallback { direction in
            print("[OnBuildDirection]")
            print(direction)
        }
        
        fplanUiView.setOnExhibitorCustomButtonClickCallback { externalId, buttonNumber, buttonUrl in
            print("[OnExhibitorCustomButtonClick] externalId=\(externalId); buttonNumber=\(buttonNumber); buttonUrl=\(buttonUrl)")
        }
        
        fplanUiView.setOnDetailsClickCallback { details in
            print("[OnDetailsClick]")
            print(details)
        }
        
        fplanUiView.load("https://demo.expofp.com/")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        fplanUiView?.destoy()
    }
}
