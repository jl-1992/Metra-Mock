//
//  ViewController.swift
//  Ventra_2
//
//  Created by Fish Ludy on 8/2/18.
//  Copyright © 2018 Fish Ludy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var skyline: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var clouds: UIImageView!
    @IBOutlet weak var trainFront: UIImageView!
    
    var timer = Timer()
    let formatter: DateFormatter = {
        let tmpFormatter = DateFormatter()
        tmpFormatter.dateFormat = "h:mm:ssa MM/dd/YY"
        return tmpFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTimer()
        animateClouds()
        animateFrontTrain()
        
    }
    
    func animateClouds() {
        let backgroundImage = UIImage(named:"Clouds")!
        let amountToKeepImageSquare = backgroundImage.size.height - self.clouds.frame.size.height
        
        // UIImageView 1
        let backgroundImageView1 = UIImageView(image: backgroundImage)
        backgroundImageView1.contentMode = UIViewContentMode.scaleAspectFit
        backgroundImageView1.frame = CGRect(x: self.clouds.frame.origin.x, y: self.clouds.frame.origin.y, width: backgroundImage.size.width - amountToKeepImageSquare, height: self.clouds.frame.size.height)
        self.view.addSubview(backgroundImageView1)
        
        // UIImageView 2
        let backgroundImageView2 = UIImageView(image: backgroundImage)
        backgroundImageView2.contentMode = UIViewContentMode.scaleAspectFit
        backgroundImageView2.frame = CGRect(x: backgroundImageView1.frame.size.width, y: self.clouds.frame.origin.y, width: backgroundImage.size.width - amountToKeepImageSquare, height: self.clouds.frame.height)
        self.view.addSubview(backgroundImageView2)
        
        self.view.insertSubview(backgroundImageView1, belowSubview: skyline)
        self.view.insertSubview(backgroundImageView2, belowSubview: skyline)
        
        UIView.animate(withDuration: 20.0, delay: 0, options: [.repeat, .curveLinear], animations: { backgroundImageView1.frame = backgroundImageView1.frame.offsetBy(dx: -1 * backgroundImageView1.frame.size.width, dy: 0.0)
            backgroundImageView2.frame = backgroundImageView2.frame.offsetBy(dx: -1 * backgroundImageView2.frame.size.width, dy: 0.0) }, completion: nil)
    }
    
    func animateFrontTrain() {
        let backgroundImage = UIImage(named:"Train_Front")!
        let amountToKeepImageSquare = backgroundImage.size.height - self.trainFront.frame.size.height
        
        // UIImageView 1
        let backgroundImageView1 = UIImageView(image: backgroundImage)
        backgroundImageView1.contentMode = UIViewContentMode.scaleAspectFit
        backgroundImageView1.frame = CGRect(x: self.trainFront.frame.origin.x, y: self.trainFront.frame.origin.y, width: backgroundImage.size.width - amountToKeepImageSquare, height: self.trainFront.frame.size.height)
        self.view.addSubview(backgroundImageView1)
        
        // UIImageView 2
        let backgroundImageView2 = UIImageView(image: backgroundImage)
        backgroundImageView2.contentMode = UIViewContentMode.scaleAspectFit
        backgroundImageView2.frame = CGRect(x: backgroundImageView1.frame.size.width, y: self.trainFront.frame.origin.y, width: backgroundImage.size.width - amountToKeepImageSquare, height: self.trainFront.frame.height)
        self.view.addSubview(backgroundImageView2)
        
        UIView.animate(withDuration: 5.0, delay: 0, options: [.repeat, .curveLinear], animations: { backgroundImageView1.frame = backgroundImageView1.frame.offsetBy(dx: -1 * backgroundImageView1.frame.size.width, dy: 0.0)
            backgroundImageView2.frame = backgroundImageView2.frame.offsetBy(dx: -1 * backgroundImageView2.frame.size.width, dy: 0.0) }, completion: nil)
    }

    
    func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        let curDate = Date()
        timeLabel.text = formatter.string(from: curDate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

