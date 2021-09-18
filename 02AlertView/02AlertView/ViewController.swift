//
//  ViewController.swift
//  02AlertView
//
//  Created by Xuân Quỳnh Lê on 2021/09/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTouchButtonTouched(_ sender: UIButton) {
        let alertViewController = UIAlertController(title: "Thông báo", message: "Bạn có phải là sinh viên UTM không?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { action in
            print("vua bam nut yes")
            
        }
        alertViewController.addAction(yesAction)
        
        let noAction = UIAlertAction(title: "No", style: .destructive) { action in
            print("vua bam nut no")
        }
        alertViewController.addAction(noAction)
        
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    @IBAction func onLoginButtonTouched(_ sender: UIButton) {
        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        self.present(loginViewController, animated: true, completion: nil)
    }
    
}

