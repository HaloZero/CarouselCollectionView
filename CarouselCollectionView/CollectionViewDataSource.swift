import UIKit

public struct CollectionMetaSection {
    public var items: [CollectionMetaItem]

    public init(items: [CollectionMetaItem], identifier: String? = nil) {
        self.items = items
    }
}

public struct CollectionMetaItem {
    public var identifier: String
    public var model: Any?

    public init(_ identifier: String, model: Any? = nil)
    {
        self.identifier = identifier
        self.model = model
    }
}

public class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    /// This closure allows more customization on how population on cells are done. The default closure will
    /// just call populateFromModel on the CollectionViewCell instance.
    public var populateCell = { (cell: CollectionViewCell, item: CollectionMetaItem) -> Void in
        cell.populateFromModel(item.model)
    }

    public var sections: [CollectionMetaSection] = []

    public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.sections.count
    }

    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }

    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let item = self.sections[indexPath.section].items[indexPath.item]
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(item.identifier,
                                                                         forIndexPath: indexPath)
        if let cell = cell as? CollectionViewCell {
            populateCell(cell, item)
        } else {
            assertionFailure("Invalid cell type \(cell.dynamicType)")
        }
        return cell
    }
}

public class CollectionViewCell: UICollectionViewCell {
    func populateFromModel(model: Any?) {
    }
}
