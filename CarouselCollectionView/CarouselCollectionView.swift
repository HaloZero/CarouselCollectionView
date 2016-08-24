import UIKit

private extension UIPageControl {
    func updateFromScrollView(scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.size.width
        self.numberOfPages = pageWidth > 0 ? Int(scrollView.contentSize.width / pageWidth) : 0
    }
}

/// Implements a carousel view -- a horizontal collection view with items that are "pages",
/// and an optional connected page control.
public class CarouselCollectionView: UICollectionView {
    @IBOutlet public var pageControl: UIPageControl? {
        willSet {
            if let oldPageControl = self.pageControl {
                oldPageControl.removeTarget(self, action: nil, forControlEvents: .ValueChanged)
            }
            if let newPageControl = self.pageControl {
                newPageControl.updateFromScrollView(self)
                newPageControl.addTarget(self, action: #selector(pageControlValueChanged),
                                         forControlEvents: .ValueChanged)
            }
        }
    }

    override public func awakeFromNib() {
        self.delegate = self
    }

    override public var contentSize: CGSize {
        didSet {
            self.pageControl?.updateFromScrollView(self)
        }
    }

    @objc
    private func pageControlValueChanged(pageControl: UIPageControl) {
        let pageWidth = self.bounds.size.width
        let x = pageControl.currentPage * Int(pageWidth);
        let rect = CGRect(origin: CGPoint(x: x, y: 0), size: self.bounds.size)
        self.scrollRectToVisible(rect, animated:true)
    }
}

extension CarouselCollectionView: UICollectionViewDelegateFlowLayout {
    public func collectionView(collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                                      sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return self.bounds.size
    }

    public func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = self.bounds.size.width
        let page = Int((self.contentOffset.x / pageWidth) + 0.5)
        self.pageControl?.currentPage = page
    }
}
