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

    func triggerNotification() {
        let center = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = "Notification Title"
        content.body = "Notification Body"

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

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
