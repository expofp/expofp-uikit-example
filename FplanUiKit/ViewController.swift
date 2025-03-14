import UIKit
import ExpoFpCommon
import ExpoFpFplan
import ExpoFpCrowdConnected
import CoreLocation

class ViewController: UIViewController {
    var fplanUiView: UIFplanView!
    
    @IBOutlet weak var container: UIView!
    
    @IBAction func selectBooth(_ sender: UIBarButtonItem) {
        self.fplanUiView.selectBooth("4.1-31")
    }
    
    @IBAction func selectExhibitor(_ sender: UIBarButtonItem) {
        self.fplanUiView?.selectExhibitor("VerdaFuel Systems")
    }
    
    @IBAction func setPosition(_ sender: UIBarButtonItem) {
        self.fplanUiView?.setCurrentPosition(BlueDotPoint(x: 9388.00, y: 9887.00, z: "1"), true)
    }
    
    @IBAction func buildRoute(_ sender: UIBarButtonItem) {
        self.fplanUiView.selectRoute(Route(from: "4.1-37", to: "4.1-11", exceptInaccessible: false))
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
    
        self.fplanUiView.load("https://demo.expofp.com?noOverlay=true")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        fplanUiView?.destoy()
    }
}
