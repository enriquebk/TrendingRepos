//
//  DateExtensions.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/13/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation

extension Date {
    var asQueryString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    static var thirtyDaysBeforeToday: Date {
        guard let date = Calendar.current.date(byAdding: .day, value: -30, to: Date()) else {
            fatalError("Error while calculating `thirtyDaysBeforeToday`")
        }
        return date
    }
}
