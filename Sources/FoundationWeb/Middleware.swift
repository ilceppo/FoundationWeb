//
//  Middleware.swift
//  FoundationWeb
//
//  Created by Matteo Cioppa on 08/06/2019.
//  Copyright © 2019 Matteo Cioppa. All rights reserved.
//

public typealias Next = ( Any... ) -> Void

public typealias Middleware =
    ( IncomingMessage,
    ServerResponse,
    @escaping Next ) -> Void
