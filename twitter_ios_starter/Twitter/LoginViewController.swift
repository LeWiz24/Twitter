//
//  LoginViewController.swift
//  Twitter
//
//  Created by Mario Olivares on 2/16/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

let user_logged_in = "userLoggedin"

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: user_logged_in) == true{
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    // This action that reacts when someone clicks on it.
    @IBAction func onLoginButton(_ sender: Any) {
        // Gets info from twitter API, tell me url, success action, failure action
        // Storing the link as a variable to keep clean
        let myUrl = "https://api.twitter.com/oauth/request_token"
        // Provides url, success action, and fail action
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            UserDefaults.standard.set(true, forKey: "userLoggedin")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }, failure: { Error in
            print("Could not authenticate")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
