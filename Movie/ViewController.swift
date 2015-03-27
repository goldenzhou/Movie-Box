//
//  ViewController.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/5/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var index: Int? {
        didSet {
            println(index!)
            images.removeAll(keepCapacity: false)
            for (var i = 1; i < 6; i++) {
                images.append("\(index!)\(i).jpg")
            }
        }
    }
  
//    let pageTitles = ["Title 1", "Title 2", "Title 3", "Title 4"]
    var images = ["1.jpg","2.jpg","3.jpg","4.jpg", "5.jpg"]
    
    var pageViewController : UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewController()
        setupPageControl()
    }
    
    private func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageViewController") as UIPageViewController
        pageController.dataSource = self
        
        if images.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers: NSArray = [firstController]
            pageController.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor.darkGrayColor()
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as PageContentViewController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex - 1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as PageContentViewController
        
        if itemController.itemIndex + 1 < images.count {
            return getItemController(itemController.itemIndex + 1)
        }
        
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> PageContentViewController? {
        
        if itemIndex < images.count {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("PageContentViewController") as PageContentViewController
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = images[itemIndex]
            return pageItemController
        }
        
        return nil
    }
    
    // MARK: - Page Indicator
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return images.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
