//
//  ViewController.swift
//  MeetTheMembers
//
//  Created by Isabella Lau on 9/6/18.
//  Copyright © 2018 Isabella Lau. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var titleBanner : UILabel!
    
    var startButton : UIButton!
    
    var logo : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        setUpLogo()
        setUpButton()
        
        // TODO: create a label that says "Meet the Members"
        setUpLabel()
    }
    
    func setUpLogo()
    {
        logo = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 3))
        logo.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 3)
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        view.addSubview(logo)
    }
    
    func setUpButton()
    {
        startButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width / 2, height: view.frame.height / 10))
        startButton.setTitle("Start", for: .normal)
        startButton.layer.cornerRadius = 10
        startButton.backgroundColor = UIColor(red: 126.0/255.0, green: 192.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        startButton.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 225)
        view.addSubview(startButton)
    }
    
    func setUpLabel()
    {
        titleBanner = UILabel(frame: CGRect(x: 10, y: 10, width: view.frame.width, height: 50))
        titleBanner.text = "Meet the Members"
        titleBanner.textAlignment = .center
        view.addSubview(titleBanner)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

