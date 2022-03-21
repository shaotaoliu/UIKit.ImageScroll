import UIKit

class ImagePageViewController: UIPageViewController {

    private var controllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateControllers()
        dataSource = self
        
        if let firstVC = controllers.first {
            setViewControllers([firstVC], direction: .forward, animated: true)
        }
    }
    
    private func populateControllers() {
        for imageName in Global.images {
            let controller = storyboard?.instantiateViewController(withIdentifier: "ImagePageOneViewController") as! ImagePageOneViewController
            controller.imageName = imageName
            controllers.append(controller)
        }
    }
}

extension ImagePageViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        let controller = viewControllers?.first
        return controllers.firstIndex(of: controller!)!
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = controllers.firstIndex(of: viewController)!
        return index == 0 ? nil : controllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = controllers.firstIndex(of: viewController)!
        return index == controllers.count - 1 ? nil : controllers[index + 1]
    }
}
