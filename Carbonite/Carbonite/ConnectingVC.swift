//
//  ConnectingVC.swift
//  Carbonite
//
//  Created by Harshith  on 21/10/21.
//

import UIKit
//import CoreBluetooth

class ConnectingVC: UIViewController  {



    @IBOutlet weak var cancelBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelBtn.layer.borderWidth = 0.5
        cancelBtn.layer.borderColor = UIColor.white.cgColor
        //centralManager = CBCentralManager(delegate: self, queue: nil)
  
        
    }
    override func viewDidAppear(_ animated: Bool) {
        permission1()
    }
    func permission2()
    {
        let alert = UIAlertController(title:"Turn on Bluetooth to Allow BEATS to connect to Accessories", message:nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Settings", style:.default, handler: {action in
            print("")
        }))
        alert.addAction(UIAlertAction(title: "Close", style:.cancel, handler: {action in
            self.movetoConnected()
        }))
        present(alert,animated: true)
        
    }
    func permission1()
    {
        let alert = UIAlertController(title:"BEATS WOULD Like to Use Bluetooth", message:"Connect an external device", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Don't Allow", style:.destructive, handler: {action in
            print("")
        }))
        alert.addAction(UIAlertAction(title: "OK", style:.default, handler: {action in
            self.permission2()
        }))
        present(alert,animated: true)
    }
    func movetoConnected()
    {
        DispatchQueue.main.asyncAfter(deadline: .now()+3 , execute: {
            self.performSegue(withIdentifier: "gotoConnected", sender: self)
        })
    }
    }






// BLE Unsupported

//    var centralManager: CBCentralManager!
//    var myPeripheral: CBPeripheral!
//    func centralManagerDidUpdateState(_ central: CBCentralManager) {
//        if central.state == CBManagerState.poweredOn
//        {
//            print("Bluetooth ON")
//        }
//        else if central.state == CBManagerState.poweredOff
//        {
//            print("BT off")
//        }
//        else if central.state == CBManagerState.resetting
//        {
//            print("Resetting")
//        }
//        else if central.state == CBManagerState.unauthorized
//        {
//            print("UnAuthorized")
//        }
//        else if central.state == CBManagerState.unsupported
//        {
//            print("unsupported")
//        }
//        else if central.state == CBManagerState.unknown
//        {
//            print("Unknown Error")
//        }
//        else
//        {
//            print("Only God can save you")
//        }
