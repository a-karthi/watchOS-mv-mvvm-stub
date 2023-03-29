//
//  NotificationHandler.swift
//  SampleWatch
//
//  Created by @karthi on 28/03/23.
//

import Foundation

import UserNotifications

class NotificationHandler: NSObject, UNUserNotificationCenterDelegate {
    
    func requestAuthorization() {
        // Request authorization for local notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            } else {
                print("Notification authorization granted: \(granted)")
            }
        }
    }

    func triggerNotification(_ title: String,_ body: String) {
        let center = UNUserNotificationCenter.current()
        
        center.delegate = self

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.01, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Error requesting authorization: \(error.localizedDescription)")
                return
            }
            if granted {
                center.add(request) { error in
                    if let error = error {
                        print("Error adding notification request: \(error.localizedDescription)")
                    } else {
                        print("Notification request added successfully")
                    }
                }
            } else {
                print("Permission denied for notifications")
            }
        }
    }

    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Handle the notification while the app is in the foreground
        completionHandler([.banner,.sound])
    }
    
}


class NotificationObserver: ObservableObject {
    @Published var notificationCount = 0
    
    @Published var payLoad: CommandStatus?

    init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleNotification),
            name: Notification.Name.dataDidFlow,
            object: nil
        )
    }
    
    
    @objc func handleNotification(_ notification: Notification) {
        notificationCount += 1
        guard let commandStatus = notification.object as? CommandStatus else { return }
        self.payLoad = commandStatus
    }
}
