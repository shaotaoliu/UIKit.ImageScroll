import UIKit

extension UIImage {
    
    func thumbnailOfSize(_ newSize: CGSize) -> UIImage? {
        let render = UIGraphicsImageRenderer(size: newSize)
        let thumbnail = render.image { _ in
            draw(in: CGRect.init(origin: CGPoint.zero, size: newSize))
        }
        
        return thumbnail
    }
}
