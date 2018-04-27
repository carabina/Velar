//
//  ConstraintAnimator.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

internal class ConstraintAnimator: ConstraintAnimatable {
    
    var viewAnimator: ViewAnimatable
    
    var transitionSpeed: TimeInterval
    
    init(transitionSpeed: TimeInterval, viewAnimator: ViewAnimatable) {
        self.transitionSpeed = transitionSpeed
        self.viewAnimator = viewAnimator
    }
    
    func updateConstraints(view: UIView, animate: Bool, completion: (()->())?) {
        guard animate == true else {
            view.layoutIfNeeded()
            if let completion = completion {
                completion()
            }
            return
        }
        
        viewAnimator.animate(duration: transitionSpeed, animations: { 
            view.layoutIfNeeded()
        }) { (_) in
            if let completion = completion {
                completion()
            }
        }
    }
}
