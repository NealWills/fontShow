//
//  LigLog.swift
//  FontShow
//
//  Created by Neal on 2019/11/20.
//  Copyright © 2019 Neal. All rights reserved.
//

import Foundation
import Log

class LibLog {
    class func setInit() {
        #if DEBUG
        Log.open = .Open
        #else
        Log.open = .Close
        #endif
    }
}
