//
//  Logic.swift
//  W3BerlinClockApp
//
//  Created by Arken Sarsenov on 14.12.2021.
//

import SwiftUI

class BerkinClock {
    
    func berlinClockData(_ hours: Int, _ minutes: Int, _ seconds: Int) -> String {
        return getSeconds(seconds) + getHours(hours) + getMinutes(minutes)
    }
    
    
    func getSeconds(_ sec: Int) -> String {
        if sec % 2 == 0 {
            return "Y"
        }
        return "Off"
    }
    
    func getHours(_ hours: Int) -> String {
        let fiveHours: Int = hours / 5
        let oneHours: Int = hours % 5
        var hoursArr: [String] = []
        if hours > 0 {
            hoursArr.append(getLampsRow(4, fiveHours, "R"))
            hoursArr.append(getLampsRow(4, oneHours, "R"))
            return hoursArr.compactMap { $0 as String}.joined()
        } else {
            hoursArr.append(getLampsRow(4, 4, "R"))
            hoursArr.append(getLampsRow(4, 4, "R"))
            return hoursArr.compactMap { $0 as String}.joined()
        }
    }
    
    func getMinutes(_ minutes: Int) -> String {
        let fiveMinutes = minutes / 5
        let oneMinute = minutes % 5
        var minutesArr: [String] = []
        
        for ind in 1...11 {
            if ind <= fiveMinutes {
                minutesArr.append(getMinutesColorLamp(ind))
            } else {
                minutesArr.append("O")
            }
        }
        
        minutesArr.append(getLampsRow(4, oneMinute, "Y"))
        return minutesArr.compactMap { $0 as String}.joined()
    }
    
    
    func getMinutesColorLamp(_ totalLampNumber: Int) -> String {
        if totalLampNumber % 3 == 0 {
            return "R"
        }
        return "Y"
    }
    
    
    func getLampsRow(_ totalNumberOfLams: Int, _ numberLampOn: Int, _ lampLabel: String) -> String {
        var rowArr:[String] = []
        for num in 1...totalNumberOfLams {
            if num <= numberLampOn {
                rowArr.append(lampLabel)
            }
            else {
                rowArr.append("O")
            }
        }
        return rowArr.compactMap {$0 as String}.joined()
    }

}




