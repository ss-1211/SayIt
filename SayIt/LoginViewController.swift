//
//  LoginViewController.swift
//  SayIt
//
//  Created by 佐々木駿 on 2019/08/29.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit
import TransitionButton

class LoginViewController: UIViewController {

    @IBOutlet weak var userMailAddress: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBAction func handleGusetLogin(_ sender: TransitionButton) {
        sender.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(3) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                sender.stopAnimation(animationStyle: .expand, completion: {
                    let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SuperHome") as! UITestViewController
                    self.present(secondVC, animated: true, completion: nil)
                })
            })
        })
    }
    @IBAction func handleRegister(_ sender: TransitionButton) {
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
