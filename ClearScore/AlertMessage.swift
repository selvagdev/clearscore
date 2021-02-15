//
//  AlertMessage.swift
//
//  Created by LShiva on 14/02/21.
//  Copyright © 2019 What3words. All rights reserved.
//

import Foundation

class AlertMessage: Error {
    
    // MARK: - Vars & Lets
    
    var title = ""
    var body = ""
    
    // MARK: - Intialization
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
    
}
