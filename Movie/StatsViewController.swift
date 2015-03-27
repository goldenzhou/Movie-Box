//
//  StatsViewController.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/13/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var drawView: BezierPathsView!
    
    var movieScores = MovieInfo().score
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        removeSubviews()
        showBricks()
        
        for view in drawView.subviews {
            let recognizer = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
            recognizer.delegate = self
            view.addGestureRecognizer(recognizer)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func showBricks() {
        var numRow = movieScores.count
        var whiteSpace = CGFloat(5)
        var unit = 10
        
        let naviBarHeight = self.navigationController?.navigationBar.frame.size.height ?? CGFloat(0)
        let tarBatHeight = self.tabBarController?.tabBar.frame.size.height ?? CGFloat(0)
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        var hScale = (drawView.frame.size.height - naviBarHeight - tarBatHeight - statusBarHeight) / CGFloat(numRow)
        
        var wScale = (drawView.frame.size.width) / CGFloat(unit + 1)
        
        for(var i = 0; i < numRow; i++) {
            var brickSize = CGSize(width: wScale * CGFloat((movieScores[i] as NSString).doubleValue), height: hScale - whiteSpace)
            var frame = CGRect(origin: CGPointZero, size: brickSize)
            frame.origin.x = wScale * 2
            frame.origin.y = CGFloat(100) + hScale * CGFloat(i)
            let blockView = UIView(frame: frame)
            blockView.backgroundColor = UIColor.orangeColor()
            drawView.addSubview(blockView)
            
            var nailSize = CGSize(width: wScale, height: hScale - whiteSpace)
            var nailFrame = CGRect(origin: CGPointZero, size: nailSize)
            nailFrame.origin.x = wScale / 2
            nailFrame.origin.y = frame.origin.y
            let nailView = UIImageView(frame: nailFrame)
            nailView.image = UIImage(named: "0\(i+1).jpg")
            drawView.addSubview(nailView)
            
            let barrierSize = brickSize
            let barrierOrigin = CGPoint(x: blockView.frame.origin.x, y: blockView.frame.origin.y)
            let path = UIBezierPath(rect: CGRect(origin: barrierOrigin, size: barrierSize))
            drawView.setPath(path, named: "\(i)")
        }
    }
    
    
    var index: Int?
    
    func handleTap(recognizer: UITapGestureRecognizer) {
        index = find(drawView.subviews as [UIView], recognizer.view!)
        self.performSegueWithIdentifier("back", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backMVC = segue.destinationViewController as DetailTableViewController
        if let newindex = index {
            backMVC.index = newindex / 2
        } else {
            backMVC.index = 0
        }
    }
    
    func removeSubviews() {
        for subview in drawView.subviews {
            if let newsubview = subview as? UIView {
                newsubview.removeFromSuperview()
            }
        }
    }
    
}
