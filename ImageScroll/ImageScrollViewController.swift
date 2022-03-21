import UIKit

class ImageScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private let images = Global.images
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateImages()
        pageControl.numberOfPages = images.count
        scrollView.delegate = self
    }
    
    func populateImages() {
        
        for i in 0..<images.count {
            let imageView = UIImageView(frame: CGRect(
                x: container.frame.width * CGFloat(i),
                y: 0,
                width: container.frame.width,
                height: container.frame.height)
            )
            
            imageView.image = UIImage(named: images[i])
            scrollView.addSubview(imageView)
        }
        
        scrollView.contentSize = CGSize(
            width: container.frame.width * CGFloat(images.count),
            height: container.frame.height
        )
    }
       
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / container.frame.width)
    }
}
