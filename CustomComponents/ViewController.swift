//
//  ViewController.swift
//  CustomComponents
//
//  Created by Lala on 04.03.24.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController {

    @IBOutlet weak var textInput: MaterialBorderedTextField!
    @IBOutlet weak var customView: CustomView!
    
    var activityIndicator : NVActivityIndicatorView!
    
    //gesture
    var tapGesture : UITapGestureRecognizer? = nil
    var swipeGesture : UISwipeGestureRecognizer? = nil
    var panGesture : UIPanGestureRecognizer? = nil
    var longGesture : UILongPressGestureRecognizer? = nil
    var pinchGesture : UIPinchGestureRecognizer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        textInput.customDelegate = self
        textInput.onSearchClick = {
            print("button click")
        }
        
        registerGesture()
    }
    
    func registerGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture?.numberOfTouchesRequired = 2
        tapGesture?.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(tapGesture!)
        
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeGesture?.direction = .right
        self.view.addGestureRecognizer(swipeGesture!)
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        //self.view.addGestureRecognizer(panGesture!)
        
        longGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLong))
        longGesture?.minimumPressDuration = 3
        self.view.addGestureRecognizer(longGesture!)
        
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        self.view.addGestureRecognizer(pinchGesture!)
    }
    
    @objc func handleTap() {
        customView.provideAnimation()
        
    }
    
    @objc func handleSwipe() {
    }
    
    @objc func handlePan(_ gesture : UIPanGestureRecognizer) {
        let transation = gesture.translation(in: view)
        customView.transform = CGAffineTransform(translationX: transation.x, y: transation.y)
        
    }
    
    @objc func handleLong() {
    }
    
    @objc func handlePinch(_ gesture : UIPinchGestureRecognizer) {
        let scale = gesture.scale
        customView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    func alternativeClick() {
        print("button click")

    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        customView.provideAnimation()
//    }
}

extension ViewController : CustomButtonInteractProtocol {

}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}


