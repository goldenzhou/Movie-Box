//
//  UpcomingViewController.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/8/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class UpcomingViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var images = ["c1.jpg", "c2.jpg", "c3.jpg", "c4.jpg", "c5.jpg", "c6.jpg", "c7.jpg", "c8.jpg", "c9.jpg", "c10.jpg"]
    
    var pageViewController : UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewController()
        setupPageControl()
    }
    
    private func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("UpcomingPageViewController") as UIPageViewController
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
        
        let itemController = viewController as UpcomingPageContentViewController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex - 1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as UpcomingPageContentViewController
        
        if itemController.itemIndex + 1 < images.count {
            return getItemController(itemController.itemIndex + 1)
        }
        
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> UpcomingPageContentViewController? {
        
        if itemIndex < images.count {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("UpcomingPageContentViewController") as UpcomingPageContentViewController
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
