import UIKit
import ExpoFpFplan

class ViewController: UIViewController {
    var fplanUiView: FplanUiKitView!
    
    @IBOutlet var container: [UIView]!
    
    @IBAction func selectExhibitor(_ sender: Any) {
        self.fplanUiView.selectExhibitor("RPMXPO")
    }
    
    @IBAction func selectBooth(_ sender: Any) {
        self.fplanUiView.selectBooth("544")
    }
    
    @IBAction func buildRoute(_ sender: Any) {
        self.fplanUiView.selectRoute(Route(from: "519", to: "656", exceptInaccessible: false))
    }

    @IBAction func clear(_ sender: Any) {
        self.fplanUiView.clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fplanUiView = FplanUiKitView()
        fplanUiView.translatesAutoresizingMaskIntoConstraints = false
        
        
        if let fplanUiViewContainer = container.first {
            fplanUiViewContainer.addSubview(fplanUiView)
            fplanUiView.leadingAnchor.constraint(equalTo: fplanUiViewContainer.leadingAnchor).isActive = true
            fplanUiView.trailingAnchor.constraint(equalTo: fplanUiViewContainer.trailingAnchor).isActive = true
            fplanUiView.topAnchor.constraint(equalTo: fplanUiViewContainer.topAnchor).isActive = true
            fplanUiView.bottomAnchor.constraint(equalTo: fplanUiViewContainer.bottomAnchor).isActive = true
            
            fplanUiView.setOnFpReadyCallback {
                
            }
            fplanUiView.load("https://demo.expofp.com")
        }
    }
}

