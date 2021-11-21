//
//  ViewController.swift
//  LoginWithGoogle
//
//  Created by Mac on 19/11/21.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    //
    //MARK: Outlets
    //
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        isPriviouslyLogined()
    }
    //
    //MARK: Previously Logined or not
    //
    private func isPriviouslyLogined(){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error == nil || user != nil {
                if let homeViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                    homeViewControllerObj.userEmail = user?.profile?.email
                    homeViewControllerObj.userName = user?.profile?.name
                    self.navigationController?.pushViewController(homeViewControllerObj, animated: true)
                }
            }
        }
    }
    //
    //MARK: loginBtnAction
    //
    @IBAction func loginBtnAction(_ sender: Any) {
        
    }
    //
    //MARK: Google Login Action
    //
    @IBAction func googleBtnAction(_ sender: Any) {
        let signInConfig = GIDConfiguration.init(clientID: "660138508289-jibgkh7240o6i2sj3ms7ce80brpnnur6.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            if let homeViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                homeViewControllerObj.userEmail = user?.profile?.email
                homeViewControllerObj.userName = user?.profile?.name
                self.navigationController?.pushViewController(homeViewControllerObj, animated: true)
            }
        }
    }
}
