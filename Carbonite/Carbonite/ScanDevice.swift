//
//  ScanDevice.swift
//  Carbonite
//
//  Created by Harshith  on 13/10/21.
//

import UIKit

class ScanDevice: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    // 2 layers - circle layer and progress layer
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        //cancelButton border
        cancelBtn.layer.borderWidth = 0.5
        cancelBtn.layer.borderColor = UIColor.white.cgColor
        //ProgressBarTimer
        self.timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block :{ _ in
            self.CircularBar()
            self.startCircle()
        })

        //move to DeviceListScreen post the time
        DispatchQueue.main.asyncAfter(deadline: .now()+6 , execute: {
            self.performSegue(withIdentifier: "showDeviceList", sender: self)
        })
        
    }
     func CircularBar()
    {
        let circularPath = UIBezierPath(arcCenter: containerView.center, radius: 150, startAngle: 0, endAngle:  CGFloat.pi * 2, clockwise: true)
                
                //ProgressLayer
                trackLayer.path = circularPath.cgPath
                view.layer.addSublayer(trackLayer)
                trackLayer.strokeColor = UIColor.lightGray.cgColor
                trackLayer.fillColor = UIColor.clear.cgColor
                trackLayer.lineWidth = 2
                //circleLayer
                shapeLayer.path = circularPath.cgPath
                view.layer.addSublayer(shapeLayer)
                shapeLayer.strokeColor = UIColor.red.cgColor
                shapeLayer.strokeEnd = 0
                shapeLayer.lineWidth = 2
                shapeLayer.fillColor = UIColor.clear.cgColor
               
    }
   public func startCircle(){
        // using stroke end property to mainpulate animation
        let progressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        progressAnimation.toValue = 3.0
        progressAnimation.duration = 6
        progressAnimation.isRemovedOnCompletion = false
        shapeLayer.add(progressAnimation, forKey: "startAnimation")
 
    }
}
