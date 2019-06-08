//
//  QueryString.swift
//  FoundationWeb
//
//  Created by Matteo Cioppa on 08/06/2019.
//  Copyright © 2019 Matteo Cioppa. All rights reserved.
//

import Foundation

fileprivate let paramDictKey =
"de.zeezide.µe.param"

/// A middleware which parses the URL query
/// parameters. You can then access them
/// using:
///
///     req.param("id")
///
public
func querystring(req  : IncomingMessage,
                 res  : ServerResponse,
                 next : @escaping Next)
{
    // use Foundation to parse the `?a=x`
    // parameters
    if let qi = URLComponents(string: req.header.uri)?.queryItems {
        #if swift(>=4.1)
        req.userInfo[paramDictKey] =
            Dictionary<String, [URLQueryItem]>(grouping: qi, by: { $0.name })
                .mapValues { $0.compactMap({ $0.value }).joined(separator: ",") }
        #else
        req.userInfo[paramDictKey] =
            Dictionary<String, [URLQueryItem]>(grouping: qi, by: { $0.name })
                .mapValues { $0.flatMap({ $0.value }).joined(separator: ",") }
        #endif
    }
    
    // pass on control to next middleware
    next()
}

public extension IncomingMessage {
    
    /// Access query parameters, like:
    ///
    ///     let userID = req.param("id")
    ///     let token  = req.param("token")
    ///
    func param(_ id: String) -> String? {
        return (userInfo[paramDictKey]
            as? [ String : String ])?[id]
    }
}
