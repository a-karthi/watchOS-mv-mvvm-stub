/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Wraps the command status.
*/

import UIKit
import WatchConnectivity

// Constants to identify the Watch Connectivity methods, also for user-visible strings in UI.
//
enum Command: String {
    case updateAppContext = "UpdateAppContext"
    case sendMessage = "SendMessage"
    case sendMessageData = "SendMessageData"
    case transferUserInfo = "TransferUserInfo"
    case transferFile = "TransferFile"
    case transferCurrentComplicationUserInfo = "TransferComplicationUserInfo"
}

// Constants to identify the phrases of Watch Connectivity communication.
//
enum Phrase: String {
    case updated = "Updated"
    case sent = "Sent"
    case received = "Received"
    case replied = "Replied"
    case transferring = "Transferring"
    case canceled = "Canceled"
    case finished = "Finished"
    case failed = "Failed"
}

// Wrap a timed color payload dictionary with a stronger type.
//
struct PayLoad {
    
    var title: String
    
    var message: String
    
    var json: [String: Any] {
        return [PayloadKey.title: title, PayloadKey.msg: message]
    }
    
    init(_ timedColor: [String: Any]) {
        guard let title = timedColor[PayloadKey.title] as? String,
            let message = timedColor[PayloadKey.msg] as? String else {
                fatalError("Timed color dictionary doesn't have right keys!")
        }
        self.title = title
        self.message = message
    }
    
    init(_ timedColor: Data) {
        let data = ((try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(timedColor)) as Any??)
        guard let dictionary = data as? [String: Any] else {
            fatalError("Failed to unarchive a timedColor dictionary!")
        }
        self.init(dictionary)
    }
}

// Wrap the command's status to bridge the commands status and UI.
//
struct CommandStatus: Equatable {
    static func == (lhs: CommandStatus, rhs: CommandStatus) -> Bool {
        return true
    }
    
    var command: Command
    var phrase: Phrase
    var payload: PayLoad?
    var fileTransfer: WCSessionFileTransfer?
    var file: WCSessionFile?
    var userInfoTranser: WCSessionUserInfoTransfer?
    var errorMessage: String?
    
    init(command: Command, phrase: Phrase) {
        self.command = command
        self.phrase = phrase
    }
}

struct PayloadKey {
    static let title = "title"
    static let msg = "msg"
}
