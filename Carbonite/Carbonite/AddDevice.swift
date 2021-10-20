//
//  AddDevice.swift
//  Carbonite
//
//  Created by Harshith  on 13/10/21.
//

import UIKit

class AddDevice: UIViewController {

    @IBOutlet weak var loginBtn: UIButton! // Login Btn
    @IBOutlet weak var bulletinLbl2: UILabel! //1
    @IBOutlet weak var bulletinLbl1: UILabel! //2
    override func viewDidLoad() {
        super.viewDidLoad()
        // login button border
        loginBtn.layer.borderWidth = 0.5
        loginBtn.layer.borderColor = UIColor.white.cgColor
        // circle bulletins
        bulletinLbl1.layer.cornerRadius = bulletinLbl2.frame.width / 2
        bulletinLbl1.layer.masksToBounds = true
        bulletinLbl2.layer.cornerRadius = bulletinLbl2.frame.width / 2
        bulletinLbl2.layer.masksToBounds = true
     
    }


}
