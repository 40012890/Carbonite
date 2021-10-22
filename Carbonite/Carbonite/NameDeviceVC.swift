//
//  NameDeviceVC.swift
//  Carbonite
//
//  Created by Harshith  on 21/10/21.
//

import UIKit

class NameDeviceVC: UIViewController {


    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var deviceNameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        underline()
        keybaordsetup()
        // Do any additional setup after loading the view.
    }
    

    
func underline()
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(origin: CGPoint(x: 0, y: deviceNameTF.frame.height-1), size: CGSize(width: deviceNameTF.frame.width, height: 1))
        bottomLine.backgroundColor = UIColor.white.cgColor
        deviceNameTF.borderStyle = UITextField.BorderStyle.none
        deviceNameTF.layer.addSublayer(bottomLine)
        
    }
    
func keybaordsetup()
    {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppears(notifcation: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappears), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    @objc private func hideKeyboard()
    {
        self.view.endEditing(true)
    }
    @objc private func keyboardAppears(notifcation: NSNotification){
        if let keyboardFrame: NSValue = notifcation.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            let bottomSpace = self.view.frame.height - (nextBtn.frame.origin.y + nextBtn.frame.height)
            self.view.frame.origin.y -= keyboardHeight - bottomSpace + 10
        }
    }
    @objc private func keyboardDisappears()
    {
        self.view.frame.origin.y = 0
    }
}
