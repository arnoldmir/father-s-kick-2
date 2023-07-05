import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var animatedButtonsOutletCollections: [AnimatedButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedButtonsOutletCollections.forEach({ $0.layer.cornerRadius = 8 })
        animatedButtonsOutletCollections.forEach({ $0.imageView?.transform = .init(scaleX: -1, y: 1) })
    }
    
    @IBAction private func presentModalController(_ sender: Any) {
        guard let vc = UIStoryboard(name: "ModalViewController", bundle: nil).instantiateInitialViewController() else { return }
        
        present(vc, animated: true)
    }
}
