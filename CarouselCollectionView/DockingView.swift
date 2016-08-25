import UIKit

/// A view that adopts a subview given to it through an IB outlet.
/// Intended for views defined on the Scene Dock:
/// https://developer.apple.com/library/ios/recipes/xcode_help-IB_storyboard/Chapters/AddViewsToDock.html
class DockingView: UIView {
    @IBOutlet var containedView: UIView? {
        willSet {
            if newValue != self.containedView {
                self.containedView?.removeFromSuperview()
            }
        }
        didSet {
            if let containedView = self.containedView {
                self.insertSubview(containedView, atIndex: 0)
                containedView.translatesAutoresizingMaskIntoConstraints = false
                let attributes: [NSLayoutAttribute] = [.Top, .Bottom, .Leading, .Trailing]
                let constraints: [NSLayoutConstraint] = attributes.map {
                    NSLayoutConstraint(item: self, attribute: $0, relatedBy: .Equal,
                        toItem: containedView, attribute: $0, multiplier: 1, constant: 0)
                }
                self.addConstraints(constraints)
            }
        }
    }
}
