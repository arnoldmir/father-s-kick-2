import UIKit

class AnimatedButton: UIButton {
    var buttonPressed: (() -> Void)?
    var buttonAnimator: UIViewPropertyAnimator?
    
    override func tintColorDidChange() {
        switch tintAdjustmentMode {
        case .dimmed:
            backgroundColor = .gray
        default:
            backgroundColor = .systemBlue
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                buttonAnimator = UIViewPropertyAnimator(duration: 0.15, curve: .easeOut, animations: {
                    self.transform = CGAffineTransform(scaleX: 0.93, y: 0.93)
                })
                buttonAnimator?.startAnimation()
                
                buttonPressed?()
            } else {
                guard let buttonAnimator = buttonAnimator else { return }
                
                if buttonAnimator.isRunning {
                    buttonAnimator.stopAnimation(true)
                    buttonAnimator.finishAnimation(at: .current)
                    buttonAnimator.addAnimations {
                        self.transform = .identity
                    }
                    buttonAnimator.startAnimation()
                } else {
                    buttonAnimator.addAnimations {
                        self.transform = .identity
                    }
                    buttonAnimator.startAnimation()
                }
            }
        }
    }
}
