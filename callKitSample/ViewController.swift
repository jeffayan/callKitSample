//
//  ViewController.swift
//  callKitSample
//
//  Created by Developer on 05/05/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit
import CallKit


class ViewController: UIViewController, CXCallObserverDelegate{

   
    @IBInspectable var bool: Bool = false
    
    @IBOutlet var setButton:UIButton!
    

   
    
    let call = CXCallObserver()
    let number = "tel://+919585290750"
    override func viewDidLoad() {
        super.viewDidLoad()
        call.setDelegate(self, queue: DispatchQueue.main)
        
        if let url = URL(string: number){
            guard UIApplication.shared.canOpenURL(url) else {
                print("failed")
                return
            }
            
            UIApplication.shared.open(url, options: [:], completionHandler: { Void in
               print("Success")
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func callObserver(_ callObserver: CXCallObserver, callChanged call: CXCall){
        print("conn ",call.hasConnected)
        print("end ",call.hasEnded)
        print("hold ",call.isOnHold)
        print("out ",call.isOutgoing)// 733D3C57-E27E-475F-93C1-D13B6E61A7CA
        print("udid ",call.uuid)
    }
    
}

@IBDesignable
class button : UIButton {
 
    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet{
            self.setButton.layer.cornerRadius = cornerRadius
        }
    }
}
