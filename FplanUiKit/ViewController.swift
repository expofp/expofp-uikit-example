import UIKit
import ExpoFpFplan

class ViewController: UIViewController {
    var fplanUiView: UIFplanView!
    
    @IBOutlet weak var container: UIView!
    
    @IBAction func selectBooth(_ sender: UIBarButtonItem) {
        self.fplanUiView.selectBooth("544")
    }
    
    @IBAction func selectExhibitor(_ sender: UIBarButtonItem) {
        self.fplanUiView.selectExhibitor("RPMXPO")
    }
    
    @IBAction func setPosition(_ sender: UIBarButtonItem) {
        self.fplanUiView.setCurrentPosition(BlueDotPoint(latitude: 38.180023, longitude: -85.845180), true)
    }
    
    @IBAction func buildRoute(_ sender: UIBarButtonItem) {
        self.fplanUiView.selectRoute(Route(from: "519", to: "656", exceptInaccessible: false))
    }
    
    @IBAction func clear(_ sender: UIBarButtonItem) {
        self.fplanUiView.clear()
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
        
        fplanUiView.load("https://demo.expofp.com")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        fplanUiView.destoy()
    }
}

