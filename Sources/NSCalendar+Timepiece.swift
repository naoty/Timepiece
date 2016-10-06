//
//  NSCalendar+Timepiece.swift
//  Timepiece
//
//  Created by Mattijs on 25/04/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Foundation


extension Calendar {
    func dateByAdding(duration: Duration, to date: Date) -> Date? {
        return self.date(byAdding: DateComponents(duration), to: date)
    }
}
