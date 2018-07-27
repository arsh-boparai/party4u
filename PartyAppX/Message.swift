//
//  Message.swift
//  PartyAppX
//
//  Created by Arshdeep Singh on 2018-07-26.
//  Copyright © 2018 Arshdeep Singh. All rights reserved.
//

import Foundation

struct Message {
    fileprivate let _messageId: String
    fileprivate let _userId: String?
    fileprivate let _message: String?
    
    var messageId: String {
        return _messageId
    }
    
    var userId: String? {
        return _userId
    }
    
    var message: String? {
        return _message
    }
    init(messageId: String, messageData: Dictionary<String, AnyObject>) {
        _messageId = messageId
        _userId = messageData["user"] as? String
        _message = messageData["message"] as? String
    }

    init(messageId: String, userId: String?, message: String?) {
        _messageId = messageId
        _userId = userId
        _message = message
    }
    static func messageArrayFromFBData(_ fbData: AnyObject) -> [Message] {
        
        var messages = [Message]()
        if let formatted = fbData as? Dictionary<String, AnyObject> {
            
            for (key, messageObj) in formatted {
                let obj = messageObj as! Dictionary<String, AnyObject>
                let message = Message(messageId: key, messageData: obj as Dictionary<String, AnyObject>)
                messages.append(message)
            }
        }
        return messages
    }
}
