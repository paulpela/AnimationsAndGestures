//
//  PanGesture01ViewController.swift
//  AnimationsAndGestures
//
//  Created by Paweł Pela on 14/12/2018.
//  Copyright © 2018 Paweł Pela. All rights reserved.
//

import UIKit

class PanGesture01ViewController: UIViewController {
    @IBOutlet weak var square: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        square.layer.shadowOpacity = 0.8
        square.layer.shadowOffset = .zero
        square.layer.shadowRadius = 8
        square.layer.cornerRadius = 4
    }
    
    @IBAction func squareDragged(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            let translation = sender.translation(in: square)
            square.frame.origin = CGPoint(
                x: square.frame.origin.x + translation.x,
                y: square.frame.origin.y + translation.y
            )
            
            if square.frame.origin.x < 0 {
                square.frame.origin.x = 0
            }
            
            if square.frame.origin.y < 64 {
                square.frame.origin.y = 64
            }
            
            if square.frame.origin.x > view.bounds.width - square.frame.width {
                square.frame.origin.x = view.bounds.width - square.frame.width
            }
            
            if square.frame.origin.y > view.bounds.height - square.frame.height {
                square.frame.origin.y = view.bounds.height - square.frame.height
            }
            
            sender.setTranslation(.zero, in: square)
        default: break
        }
    }
    
}
