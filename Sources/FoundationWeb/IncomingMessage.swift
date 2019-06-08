//
//  IncomingMessage.swift
//  FoundationWeb
//
//  Created by Matteo Cioppa on 08/06/2019.
//  Copyright © 2019 Matteo Cioppa. All rights reserved.
//

import NIOHTTP1

open class IncomingMessage {
    
    public let header   : HTTPRequestHead
    public var userInfo = [ String : Any ]()
    
    init(header: HTTPRequestHead) {
        self.header = header
    }
}
