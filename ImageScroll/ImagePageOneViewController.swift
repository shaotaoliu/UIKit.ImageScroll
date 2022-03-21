import UIKit

class ImagePageOneViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName)
    }

}
