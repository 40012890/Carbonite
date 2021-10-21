//
//  ConnectingVC.swift
//  Carbonite
//
//  Created by Harshith  on 21/10/21.
//

import UIKit
import CoreBluetooth

class ConnectingVC: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {

    var centralManager: CBCentralManager!
    var myPeripheral: CBPeripheral!

    @IBOutlet weak var cancelBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelBtn.layer.borderWidth = 0.5
        cancelBtn.layer.borderColor = UIColor.white.cgColor
        // Do any additional setup after loading the view.
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == CBManagerState.poweredOn
        {
            print("Bluetooth ON")
        }
        else
        {
            print("Something wrong with Bluetooth")
        }
    }



}
