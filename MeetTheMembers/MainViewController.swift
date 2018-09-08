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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        setUpLogo()
        setUpButton()
        setUpLabel()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let _ = segue.destination as! GameViewController
    }
    
    // Load MDB logo
    private func setUpLogo()
    {
        logo = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 3))
        logo.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 3)
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        view.addSubview(logo)
    }
    
    // Load start button
    private func setUpButton()
    {
        startButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width / 2, height: view.frame.height / 10))
        startButton.setTitle("Begin Game", for: .normal)
        startButton.layer.cornerRadius = 10
        startButton.backgroundColor = UIColor(red: 126.0/255.0, green: 192.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        startButton.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 225)
        view.addSubview(startButton)
        
        startButton.addTarget(self, action: #selector(startClicked), for: .touchUpInside)
    }
    
    // Load game title
    private func setUpLabel()
    {
        titleBanner = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        titleBanner.text = "Meet the Members"
        titleBanner.font = UIFont(name: "AmericanTypewriter", size: 25.0)
        titleBanner.textAlignment = .center
        titleBanner.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 285)
        view.addSubview(titleBanner)
    }
    
    @objc func startClicked()
    {
        performSegue(withIdentifier: "toGame", sender: self)
    }
}

