//
//  DeviceList.swift
//  Carbonite
//
//  Created by Harshith  on 19/10/21.
//

import UIKit

class DeviceList: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var connectBtn: UIButton! //plus
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var deviceNameLbl: UILabel! //Device Name
    var contentWidth:CGFloat = 0.0 // initail width
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        //looping through all images.
        for image in 0...2 {
            let imageToDisplay = UIImage(named: "\(image).png") //seeking image
            let imageView = UIImageView(image: imageToDisplay) // displaying that image in the ImgView
            
            imageView.contentMode = .scaleAspectFit
            let xCord = self.view.frame.width * CGFloat(image) //X-Cordinates as per view
            contentWidth += view.frame.width
            imageView.frame = CGRect(x: xCord, y:0, width: self.scrollView.frame.width, height:self.scrollView.frame.height)
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(image + 1) // adjusting image view to scroll view.
            scrollView.addSubview(imageView) //adding the imageview

        }
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageCtrl.currentPage = Int(scrollView.contentOffset.x / CGFloat(414))
    }
    //ScrollEnd Handling to change the text accordingly
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        
        
        //change the text accordingly
        if Int(currentPage) == 0{
            deviceNameLbl.text = "Beats Blast"
        }
        else if Int(currentPage) == 1{
            deviceNameLbl.text = "Xbox Series X"
        }
        else if Int(currentPage) == 2{
            deviceNameLbl.text = "Beats Dynamite"
        }else{
            deviceNameLbl.text = "Beats Blast 10"
        }
        
    }


}


// Ignore
//            let xCord = view.frame.midX + view.frame.width * CGFloat(image)
//            contentWidth += view.frame.width
//
//            scrollView.addSubview(imageView)
//            imageView.frame = CGRect(x: xCord - 200, y: view.frame.height / 8, width: 400, height: 400)
