//
//  ViewController.swift
//  Ventra_2
//
//  Created by Fish Ludy on 8/2/18.
//  Copyright © 2018 Fish Ludy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var clouds: UIImageView!

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
        
    }
    
    func animateClouds() {
        let backgroundImage = UIImage(named:"Clouds")!
        let amountToKeepImageSquare = backgroundImage.size.height - self.view.frame.size.height
        
        // UIImageView 1
        let backgroundImageView1 = UIImageView(image: backgroundImage)
       // backgroundImageView1.frame = clouds.frame
        backgroundImageView1.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: backgroundImage.size.width - amountToKeepImageSquare, height: self.view.frame.size.height)
        self.view.addSubview(backgroundImageView1)
        
        // UIImageView 2
        let backgroundImageView2 = UIImageView(image: backgroundImage)
       // backgroundImageView2.frame = clouds.frame
        backgroundImageView2.frame = CGRect(x: backgroundImageView1.frame.size.width, y: self.view.frame.origin.y, width: backgroundImage.size.width - amountToKeepImageSquare, height: self.view.frame.height)
        self.view.addSubview(backgroundImageView2)
        
        UIView.animate(withDuration: 6.0, delay: 0, options: [.repeat, .curveLinear], animations: { backgroundImageView1.frame = backgroundImageView1.frame.offsetBy(dx: -1 * backgroundImageView1.frame.size.width, dy: 0.0)
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

