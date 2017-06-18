//
//  MyPageViewController.swift
//  snowboarders
//
//  Created by tak.msk on 2017/06/18.
//  Copyright © 2017年 takmsk. All rights reserved.
//

import UIKit
import Firebase

class MyPageViewController: UIViewController {

    @IBOutlet weak var myEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let user = Auth.auth().currentUser
        if let user = user {
            // let uid = user.uid
            let email = user.email
            
            myEmail.text = email
            
            print("user object: \(user)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignOutTapped(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            self.performSegue(withIdentifier: "signedOutSegue", sender: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
