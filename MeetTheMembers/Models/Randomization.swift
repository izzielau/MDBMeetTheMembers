//
//  Randomization.swift
//  MeetTheMembers
//
//  Created by Isabella Lau on 9/6/18.
//  Copyright © 2018 Isabella Lau. All rights reserved.
//

import UIKit

class Randomization {
    
    var randomIndex : Int = 0
    
    var names = [String]()

    let members : [String] = ["Aayush Tyagi", "Abhinav Koppu", "Aditya Yadav", "Ajay Merchia", "Alice Zhao", "Amy Shen", "Anand Chandra", "Andres Medrano", "Angela Dong", "Anika Bagga", "Anmol Parande", "Austin Davis", "Ayush Kumar", "Brandon David", "Candice Ye", "Carol Wang", "Cody Hsieh", "Daniel Andrews", "Daniel Jing", "Eric Kong", "Ethan Wong", "Fang Shuo", "Izzie Lau", "Jaiveer Singh", "Japjot Singh", "Jeffrey Zhang", "Joey Hejna", "Julie Deng", "Justin Kim", "Kaden Dippe", "Kanyes Thaker", "Kayli Jiang", "Kiana Go", "Leon Kwak", "Levi Walsh", "Louie McConnell", "Max Miranda", "Michelle Mao", "Mohit Katyal", "Mudabbir Khan", "Natasha Wong", "Nikhar Arora", "Noah Pepper", "Radhika Dhomse", "Sai Yandapalli","Samanvi Rai", "Sarah Tang", "Sharie Wang", "Shiv Kushwah", "Shomil Jain", "Shreya Reddy", "Shubha J.", "Shubham Gupta", "Srujay Korlakunta", "Stephen Jayakar", "Suyash Gupta", "Tiger Chen", "Vaibhav Gattani", "Victor Sun", "Vidya Ravikumar", "Vineeth Yeevani", "Wilbur Shi", "William Lu", "Will Oakley", "Xin Yi Chen", "Young Lin"]

    func createRandomizedNames()
    {
        randomIndex = Int(arc4random_uniform(66))
        names.append(members[randomIndex])
        
        while (names.count < 4) {
            randomIndex = Int(arc4random_uniform(66))
            if (names.contains(members[randomIndex]) == false)
            {
                names.append(members[randomIndex])
            }
        }
    }
    
    func returnRandomizedNames() -> [String]
    {
        return names
    }
    
    func chooseWinner() -> Int
    {
        return Int(arc4random_uniform(4))
    }
    
    func resetArray()
    {
        names.removeAll()
    }
}
