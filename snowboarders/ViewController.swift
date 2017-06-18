//
//  ViewController.swift
//  snowboarders
//
//  Created by tak.msk on 2017/06/18.
//  Copyright © 2017年 takmsk. All rights reserved.
//

import UIKit
import Firebase
import FacebookLogin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn([.publicProfile, .email], viewController: self, completion: {
            result in
            switch result {
            case let .success(permission, declinePermission, token):
                print("token:\(token),\(permission),\(declinePermission)")
                let credential = FacebookAuthProvider.credential(withAccessToken: token.authenticationToken)
                self.signIn(credential: credential)
            case let .failed(error):
                print("error:\(error)")
            case .cancelled:
                print("cancelled")
            }
        })
    }
    
    func signIn(credential:AuthCredential) {
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print("error:\(error)")
                return
            } else {
                self.performSegue(withIdentifier: "signedInSegue", sender: nil)
            }
            return
        }
    }

}

