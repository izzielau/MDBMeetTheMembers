//
//  GameViewController.swift
//  MeetTheMembers
//
//  Created by Isabella Lau on 9/7/18.
//  Copyright © 2018 Isabella Lau. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var winner : Int!
    var score = 0
    var currentStreak = 0
    var highestStreak = 0
    
    var path : String!
    var recentAnswers : [String] = []

    var seconds = 5.0

    var firstTime = true
    var paused = false
    
    var buttons : [UIButton] = []

    var topLeftName : UIButton!
    var topRightName : UIButton!
    var botLeftName : UIButton!
    var botRightName : UIButton!
    var startStop : UIButton!
    var statsButton : UIButton!
    var statsBarButton : UIBarButtonItem!
    
    var picture : UIImageView!
    
    var labels : [UILabel] = []

    var timerLabel : UILabel!
    var scoreLabel : UILabel!
    var timerTitle : UILabel!
    var scoreTitle : UILabel!
    
    var timer : Timer!
    var displayTimer : Timer!
    var expiredTimer : Timer!

    let randomization = Randomization()
    let constants = Constants()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        createStartTimeScoreLabels()
        initiateStatsButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func generateRound()
    {
        picture?.removeFromSuperview()
        
        randomization.resetArray()
        randomization.createRandomizedNames()
        
        instantiateButtons()
        randomizeButtons()
        chooseWinnerDisplayImage()
    }
    
    private func createStartTimeScoreLabels()
    {
        seconds = 0
        
        timerLabel = UILabel(frame: constants.labelSize)
        scoreLabel = UILabel(frame: constants.labelSize)
        timerTitle = UILabel(frame: constants.labelSize)
        scoreTitle = UILabel(frame: constants.labelSize)
        labels = [timerLabel, scoreLabel, timerTitle, scoreTitle]
        
        timerLabel.text = "\(seconds)"
        timerLabel.center = CGPoint(x: view.frame.width / 4, y: view.frame.height - 50)
        scoreLabel.text = "\(score)"
        scoreLabel.center = CGPoint(x: 3 * view.frame.width / 4, y: view.frame.height - 50)
        timerTitle.text = "Timer"
        timerTitle.center = CGPoint(x: view.frame.width / 4, y: view.frame.height - 85)
        scoreTitle.text = "Score"
        scoreTitle.center = CGPoint(x: 3 * view.frame.width / 4, y: view.frame.height - 85)
        
        startStop = UIButton(frame: CGRect(x: 0, y: 0, width: 3 * view.frame.width / 7, height: view.frame.height / 12))
        startStop.setTitle("Start", for: .normal)
        startStop.backgroundColor = constants.blue
        startStop.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 145)
        startStop.addTarget(self, action: #selector(startStopClicked), for: .touchUpInside)
        view.addSubview(startStop)
        
        for label in labels
        {
            label.font = UIFont(name: "AmericanTypewriter", size: 25)
            label.textAlignment = .center
            view.addSubview(label)
        }
    }
    
    private func instantiateButtons()
    {
        topLeftName = UIButton(frame: CGRect(x: 0, y: 0, width: 3 * view.frame.width / 7, height: view.frame.height / 12))
        topRightName = UIButton(frame: CGRect(x: 0, y: 0, width: 3 * view.frame.width / 7, height: view.frame.height / 12))
        botLeftName = UIButton(frame: CGRect(x: 0, y: 0, width: 3 * view.frame.width / 7, height: view.frame.height / 12))
        botRightName = UIButton(frame: CGRect(x: 0, y: 0, width: 3 * view.frame.width / 7, height: view.frame.height / 12))
        
        buttons = [topLeftName, topRightName, botLeftName, botRightName]
    }
    
    private func randomizeButtons()
    {
        topLeftName.setTitle(randomization.returnRandomizedNames()[0], for: .normal)
        topRightName.setTitle(randomization.returnRandomizedNames()[1], for: .normal)
        botLeftName.setTitle(randomization.returnRandomizedNames()[2], for: .normal)
        botRightName.setTitle(randomization.returnRandomizedNames()[3], for: .normal)
        
        for button in buttons {
            button.layer.cornerRadius = 10
            button.backgroundColor = constants.lightBlue
            
            if button == topLeftName {
                button.center = CGPoint(x: view.frame.width / 4, y: view.frame.height - 275)
                button.addTarget(self, action: #selector(topLeftClicked), for: .touchUpInside)
            } else if button == topRightName {
                button.center = CGPoint(x: 3 * view.frame.width / 4, y: view.frame.height - 275)
                button.addTarget(self, action: #selector(topRightClicked), for: .touchUpInside)
            } else if button == botLeftName {
                button.center = CGPoint(x: view.frame.width / 4, y: view.frame.height - 210)
                button.addTarget(self, action: #selector(botLeftClicked), for: .touchUpInside)
            } else {
                button.center = CGPoint(x: 3 * view.frame.width / 4, y: view.frame.height - 210)
                button.addTarget(self, action: #selector(botRightClicked), for: .touchUpInside)
            }
            
            view.addSubview(button)
        }
    }
    
    private func chooseWinnerDisplayImage()
    {
        winner = randomization.chooseWinner()
        
        path = buttons[winner].currentTitle?.replacingOccurrences(of: " ", with: "").lowercased()
        
        picture = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 3))
        picture.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 3)
        picture.image = UIImage(named: String(path))
        picture.contentMode = .scaleAspectFit
        view.addSubview(picture)
    }
    
    private func answerSubmitted(chosen : UIButton, correct : Bool)
    {
        for button in buttons {
            if chosen == button && correct {
                button.backgroundColor = constants.lightBlue
                score += 1
                scoreLabel.text = "\(score)"
                
                currentStreak += 1
                recentAnswers.append(chosen.currentTitle!)

                if (currentStreak > highestStreak) {
                    highestStreak = currentStreak
                }
            }
            else if chosen == button && !correct {
                button.backgroundColor = constants.red
                
                recentAnswers.append(chosen.currentTitle!)
                currentStreak = 0
            }
            else {
                button.backgroundColor = constants.silver
            }
            
            if recentAnswers.count > 3 {
                recentAnswers.remove(at: 0)
            }
        }
    }
    
    private func changeButtonColors(num : Int, button : UIButton)
    {
        if num == winner {
            answerSubmitted(chosen: button, correct: true)
        } else {
            answerSubmitted(chosen: button, correct: false)
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
            self.seconds = 5.0
            self.clearScreen()
            self.runTimer()
            self.generateRound()
        }
    }
    
    private func changeButtonsToRed()
    {
        for button in buttons {
            button.backgroundColor = constants.red
        }
    }
    
    private func runTimer()
    {
        displayTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            self.timerLabel.text = "\(round(self.seconds * 10)/10)"
            if !self.paused {
                self.seconds -= 0.1
            }
            
            if self.seconds <= 0.0 {
                self.paused = true
                self.seconds = 5.0
                self.changeButtonsToRed()
                
                self.expiredTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (expiredTimer) in
                    self.paused = false
                    self.clearScreen()
                    self.generateRound()
                }
            }
        }
    }
    
    private func initiateStatsButton()
    {
        statsButton = UIButton(type: .custom)
        statsButton.setImage(UIImage(named: "stats"), for: .normal)
        statsButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        statsButton.imageView?.contentMode = .scaleAspectFit
        statsButton.addTarget(self, action: #selector(statsClicked), for: .touchUpInside)
        statsBarButton = UIBarButtonItem(customView: statsButton)

        self.navigationItem.setRightBarButton(statsBarButton, animated: true)
    }
    
    private func clearScreen()
    {
        picture?.removeFromSuperview()
        for button in buttons {
            button.removeFromSuperview()
        }
    }
    
    @objc func topLeftClicked()
    {
        changeButtonColors(num: 0, button: topLeftName)
        displayTimer.invalidate()
    }
    
    @objc func topRightClicked()
    {
        changeButtonColors(num: 1, button: topRightName)
        displayTimer.invalidate()
    }
    
    @objc func botLeftClicked()
    {
        changeButtonColors(num: 2, button: botLeftName)
        displayTimer.invalidate()
    }
    
    @objc func botRightClicked()
    {
        changeButtonColors(num: 3, button: botRightName)
        displayTimer.invalidate()
    }
    
    @objc func startStopClicked()
    {
        if (startStop.currentTitle == "Start")
        {
            startStop.setTitle("Stop", for: .normal)

            seconds = 5.0
            generateRound()
            runTimer()
        } else {
            startStop.setTitle("Start", for: .normal)
            clearScreen()
            
            timer?.invalidate()
            displayTimer?.invalidate()
            expiredTimer?.invalidate()
        }
    }

    @objc func statsClicked()
    {
        startStop.setTitle("Stop", for: .normal)
        startStopClicked()

        performSegue(withIdentifier: "toStats", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let statsVC = segue.destination as! StatsViewController
        statsVC.highestStreak = highestStreak
        statsVC.recentAnswers = recentAnswers
    }
}
