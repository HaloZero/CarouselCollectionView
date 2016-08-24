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
                containedView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
                containedView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
                containedView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
                containedView.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor).active = true
            }
        }
    }
}
