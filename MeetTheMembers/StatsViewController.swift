//
//  StatsViewController.swift
//  MeetTheMembers
//
//  Created by Isabella Lau on 9/8/18.
//  Copyright © 2018 Isabella Lau. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    var highestStreak : Int?
    
    var recentAnswers : [String]?
    
    var logo : UIImageView!
    
    var streakBanner : UILabel!
    var recentBanner : UILabel!
    var streakData : UILabel!
    var recentData : UILabel!

    var constants = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpLogo()
        setUpLabels()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Load MDB logo
    private func setUpLogo()
    {
        logo = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 6))
        logo.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 5)
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        view.addSubview(logo)
    }
    
    // Load game title
    private func setUpLabels()
    {
        streakBanner = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 60))
        streakBanner.text = "Highest streak"
        streakBanner.font = UIFont(name: "Noteworthy-Light", size: 25.0)
        streakBanner.textAlignment = .center
        streakBanner.backgroundColor = constants.lightBlue
        streakBanner.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 400)
        view.addSubview(streakBanner)
        
        recentBanner = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 60))
        recentBanner.text = "Recent answers"
        recentBanner.font = UIFont(name: "Noteworthy-Light", size: 25.0)
        recentBanner.textAlignment = .center
        recentBanner.backgroundColor = constants.lightBlue
        recentBanner.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 275)
        view.addSubview(recentBanner)
    }
    
    private func loadData()
    {
        streakData = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 30))
        streakData.text = "\(highestStreak!)"
        streakData.font = UIFont(name: "AmericanTypewriter", size: 18.0)
        streakData.textAlignment = .center
        streakData.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 335)
        view.addSubview(streakData)
        
        var combination : String = ""
        for answer in recentAnswers! {
            combination += answer + "  "
        }
        
        recentData = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 48.0))
        recentData.font = UIFont(name: "AmericanTypewriter", size: 18.0)
        recentData.textAlignment = .center
        recentData.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 210)
        recentData.lineBreakMode = NSLineBreakMode.byWordWrapping
        recentData.numberOfLines = 3
        recentData.text = combination
        view.addSubview(recentData)
    }
}
