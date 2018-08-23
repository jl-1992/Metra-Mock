//
//  ViewController.swift
//  Ventra_2
//
//  Created by Fish Ludy on 8/2/18.
//  Copyright © 2018 Fish Ludy. All rights reserved.
//

// TO-DO:
// 1. Add in on-click event
// 2. Check timing of entire view
// 3. General cleanup of layout

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var clouds: UIImageView!
    @IBOutlet weak var trainFront: UIImageView!
    @IBOutlet weak var trainBack: UIImageView!
    @IBOutlet weak var station: UIImageView!
    @IBOutlet weak var skyline: UIImageView!
    @IBOutlet weak var people: UIImageView!
    
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
        animateBackTrain()
        animatePeople()
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
    
    func animateBackTrain() {
        let backgroundImage = UIImage(named:"Train_Back")!
        let amountToKeepImageSquare = backgroundImage.size.height - self.trainBack.frame.size.height
        
        // UIImageView 1
        let backgroundImageView1 = UIImageView(image: backgroundImage)
        backgroundImageView1.contentMode = UIViewContentMode.scaleAspectFit
        backgroundImageView1.frame = CGRect(x: self.trainBack.frame.maxX, y: self.trainBack.frame.origin.y, width: -backgroundImage.size.width + amountToKeepImageSquare, height: self.trainBack.frame.size.height)
        self.view.addSubview(backgroundImageView1)
        
        // UIImageView 2 (change both widths to change train timing loop)
        let backgroundImageView2 = UIImageView(image: backgroundImage)
        backgroundImageView2.contentMode = UIViewContentMode.scaleAspectFit
        backgroundImageView2.frame = CGRect(x: -backgroundImageView1.frame.size.width + self.trainBack.frame.maxX, y: self.trainBack.frame.origin.y, width: -backgroundImage.size.width + amountToKeepImageSquare, height: self.trainBack.frame.height)
        self.view.addSubview(backgroundImageView2)
        
        self.view.insertSubview(backgroundImageView1, belowSubview: station)
        self.view.insertSubview(backgroundImageView2, belowSubview: station)
        
        UIView.animate(withDuration: 9.0, delay: 0, options: [.repeat, .curveLinear], animations: {
            backgroundImageView1.frame = backgroundImageView1.frame.offsetBy(dx: 1 * backgroundImageView1.frame.size.width, dy: 0.0)
            backgroundImageView2.frame = backgroundImageView2.frame.offsetBy(dx: 1 * backgroundImageView2.frame.size.width, dy: 0.0)}, completion: nil)
    }
    
    // Define people image values
    
    
    
    func animatePeople() {
        // First two people who enter from left
        let image1 = UIImage(named:"People_1")!
        
        let people1 = UIImageView(image: image1)
        people1.contentMode = UIViewContentMode.scaleAspectFit
        people1.frame = CGRect(x: self.people.frame.origin.x, y: self.people.frame.origin.y, width: image1.size.width, height: self.people.frame.size.height)
        self.view.addSubview(people1)

        self.view.insertSubview(people1, belowSubview: station)
        
        UIView.animate(withDuration: 5.0, delay: 0, options: [.curveLinear], animations: {
            people1.frame = people1.frame.offsetBy(dx: 4 * people1.frame.size.width, dy: 0.0)}, completion: nil)
        
        // Person 1 (from left)
        let image2 = UIImage(named:"Person")!
        
        let person1 = UIImageView(image: image2)
        person1.contentMode = UIViewContentMode.scaleAspectFit
        person1.frame = CGRect(x: self.people.frame.origin.x - 45, y: self.people.frame.origin.y, width: image2.size.width, height: self.people.frame.size.height)
        self.view.addSubview(person1)
        
        self.view.insertSubview(person1, belowSubview: station)
        
        UIView.animate(withDuration: 4.0, delay: 4.0, options: [.curveLinear], animations: {
            person1.frame = person1.frame.offsetBy(dx: self.people.frame.maxX, dy: 0.0)
        }, completion: { finished in
            if finished {
                UIView.animate(withDuration: 4.0, delay: 0, options: [.curveLinear], animations: {
                    person1.frame = person1.frame.offsetBy(dx: -self.people.frame.maxX - 30, dy: 0.0)
                }, completion: nil)
            }
        })
        
        // First two people who enter from right
        let image3 = UIImage(named:"People_3")!
        
        let people3 = UIImageView(image: image3)
        people3.contentMode = UIViewContentMode.scaleAspectFit
        people3.frame = CGRect(x: self.people.frame.maxX, y: self.people.frame.origin.y, width: image1.size.width, height: self.people.frame.size.height)
        self.view.addSubview(people3)
        
        self.view.insertSubview(people3, belowSubview: station)
        
        UIView.animate(withDuration: 5.0, delay: 4.5, options: [.curveLinear], animations: {
            people3.frame = people3.frame.offsetBy(dx: -self.people.frame.size.width - people3.frame.size.width, dy: 0.0)}, completion: nil)

        // Person 2 (from left)
        let person2 = UIImageView(image: image2)
        person2.contentMode = UIViewContentMode.scaleAspectFit
        person2.frame = CGRect(x: self.people.frame.origin.x - 45, y: self.people.frame.origin.y, width: image2.size.width, height: self.people.frame.size.height)
        self.view.addSubview(person2)
        
        self.view.insertSubview(person2, belowSubview: station)
        
        UIView.animate(withDuration: 4.0, delay: 5.0, options: [.curveLinear], animations: {
            person2.frame = person2.frame.offsetBy(dx: self.people.frame.maxX + 20, dy: 0.0)
        }, completion: nil)
        
        // Second two people from right
        let people4 = UIImageView(image: image1)
        people4.contentMode = UIViewContentMode.scaleAspectFit
        people4.frame = CGRect(x: self.people.frame.maxX, y: self.people.frame.origin.y, width: image1.size.width, height: self.people.frame.size.height)
        self.view.addSubview(people4)
        
        self.view.insertSubview(people4, belowSubview: station)
        
        // Last two people from left that end abruptly
        let people5 = UIImageView(image: image1)
        people5.contentMode = UIViewContentMode.scaleAspectFit
        people5.frame = CGRect(x: self.people.frame.origin.x - people5.frame.size.width, y: self.people.frame.origin.y, width: image1.size.width, height: self.people.frame.size.height)
        self.view.addSubview(people5)
        
        self.view.insertSubview(people5, belowSubview: station)
        
        // Animate people4
        UIView.animate(withDuration: 7.0, delay: 8.5, options: [.curveLinear], animations: {
            people4.frame = people4.frame.offsetBy(dx: -self.people.frame.size.width, dy: 0.0)}, completion: { finished in
                if finished {
                    people5.isHidden = true
                    people4.isHidden = true
                    self.animatePeople()
                }
        })
        
        // Animate people5
        UIView.animate(withDuration: 7.0, delay: 9.0, options: [.curveLinear], animations: {
            people5.frame = people5.frame.offsetBy(dx: 2 * people5.frame.size.width, dy: 0.0)}, completion: nil)
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

