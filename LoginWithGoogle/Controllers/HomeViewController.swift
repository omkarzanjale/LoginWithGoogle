//
//  HomeViewController.swift
//  LoginWithGoogle
//
//  Created by Mac on 21/11/21.
//

import UIKit
import GoogleSignIn

class HomeViewController: UIViewController {

    var userEmail: String?
    var userName: String?
    
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        title = "Profile"
        userEmailLabel.text = userEmail
        userNameLabel.text = userName

    }
    //
    //MARK: logOut Btn Action
    //
    @IBAction func logOutBtnAction(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()
        navigationController?.popViewController(animated: true)
    }
    
}
