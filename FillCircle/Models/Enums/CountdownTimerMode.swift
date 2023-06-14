//
//  CountdownTimerMode.swift
//  FillCircle
//
//  Created by Jaden Nation on 6/13/23.
//

import Foundation

enum CountdownTimerMode: Int {
    case showRemainingSegmentDuration
    case showRemainingDuration
    case showSpentDuration
    
    static func values() -> [CountdownTimerMode] {
        return [.showRemainingSegmentDuration, .showRemainingDuration, .showSpentDuration]
    }
    
    func nextMode() -> CountdownTimerMode {
        let curVal = self.rawValue
        let allVals = CountdownTimerMode.values()
        if curVal == allVals.last?.rawValue {
            return allVals[0]
        }
        return allVals[curVal + 1]
    }
}
