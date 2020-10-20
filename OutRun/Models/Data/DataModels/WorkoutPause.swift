//
//  WorkoutPause.swift
//
//  OutRun
//  Copyright (C) 2020 Tim Fraedrich <timfraedrich@icloud.com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

import Foundation
import CoreStore

typealias WorkoutPause = OutRunV4.WorkoutPause

extension WorkoutPause: CustomStringConvertible {
    
    var description: String {
        return "WorkoutPause(" + (uuid.value != nil ? "uuid: \(uuid.value!), " : "") + "start: \(startDate.value), end: \(endDate.value), duration: \(duration))"
    }
    
    var duration: TimeInterval {
        return startDate.value.distance(to: endDate.value)
    }
    
    enum WorkoutPauseType: RawRepresentable, ImportableAttributeType {
        
        typealias RawValue = Int
        
        case manual
        case automatic
        
        init(rawValue: Int) {
            switch rawValue {
            case 1:
                self = .automatic
            default:
                self = .manual
            }
        }
        
        var rawValue: Int {
            switch self {
            case .manual:
                return 0
            case .automatic:
                return 1
            }
        }
    }
    
}
