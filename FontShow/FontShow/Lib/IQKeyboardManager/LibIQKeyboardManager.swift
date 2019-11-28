//
//  LibIQKeyboardManager.swift
//  FontShow
//
//  Created by Neal on 2019/11/20.
//  Copyright © 2019 Neal. All rights reserved.
//

import Foundation
import IQKeyboardManager

class LibIQKeyboardManager: NSObject {
    
    class func setInit() {
        self.setOpen(true)
        self.setShouldResignOnTouchOutside(true)
    }

}

extension LibIQKeyboardManager {
    
    class func setOpen(_ open: Bool = true) {
        IQKeyboardManager.shared().isEnabled = open
    }
    
    class func setShouldResignOnTouchOutside(_ open: Bool = true) {
        IQKeyboardManager.shared().shouldResignOnTouchOutside = open
    }
    
}
