//
//  CurrentRunVC.swift
//  treads
//
//  Created by Andre Burgoyne on 2018-10-10.
//  Copyright © 2018 Andre Burgoyne. All rights reserved.
//

import UIKit

class CurrentRunVC: LocationVC {
    
    //outlets
    @IBOutlet weak var slideBGImage: UIImageView!
    @IBOutlet weak var sliderImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(endRunSwiped(sender: )))
        sliderImage.addGestureRecognizer(swipeGesture)
        sliderImage.isUserInteractionEnabled = true
        swipeGesture.delegate = self as? UIGestureRecognizerDelegate
    }
    
    @objc func endRunSwiped(sender: UIPanGestureRecognizer) {
        let minAdjust: CGFloat = 80
        let maxAdjust: CGFloat = 128.5
        if let sliderView = sender.view {
            if sender.state == UIGestureRecognizer.State.began || sender.state == UIGestureRecognizer.State.changed {
                let translation = sender.translation(in: self.view)
                if sliderView.center.x >= (slideBGImage.center.x - minAdjust) && sliderView.center.x <= (slideBGImage.center.x + maxAdjust) {
                    sliderView.center.x = sliderView.center.x + translation.x
                } else if sliderView.center.x >= (slideBGImage.center.x + maxAdjust) {
                    sliderView.center.x = slideBGImage.center.x + maxAdjust
                    //End run code
                    dismiss(animated: true, completion: nil)
                } else {
                    sliderView.center.x = slideBGImage.center.x - minAdjust
                }
                sender.setTranslation(CGPoint.zero, in: self.view)
            } else if sender.state == UIGestureRecognizer.State.ended {
                UIView.animate(withDuration: 0.1, animations: {
                    sliderView.center.x = self.slideBGImage.center.x - minAdjust
                })
            }
        }
    }
}
