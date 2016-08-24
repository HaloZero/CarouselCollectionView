import UIKit

class KittenCollectionCell: CollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!

    override func populateFromModel(model: Any?) {
        super.populateFromModel(model)
        self.imageView.image = model as? UIImage
    }
}

class ViewController: UITableViewController {

    @IBOutlet var kittensDataSource: CollectionViewDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()

        let model1 = UIImage(named: "kitten")
        let model2 = UIImage(named: "kitten2")

        let items = [
            CollectionMetaItem("greenCell", model: model1),
            CollectionMetaItem("pinkCell", model: model2),
            CollectionMetaItem("greenCell", model: model1),
            CollectionMetaItem("pinkCell", model: model1),
            CollectionMetaItem("greenCell", model: model2),
            CollectionMetaItem("pinkCell", model: model2),
        ]
        self.kittensDataSource.sections = [
            CollectionMetaSection(items: items),
        ]
    }
}
