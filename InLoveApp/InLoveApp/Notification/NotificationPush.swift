//
//  NotificationPush.swift
//  InLoveApp
//
//  Created by Vu Thien on 06/12/2021.
//

import Foundation
import UserNotifications

class UserNotification : NSObject,UNUserNotificationCenterDelegate {
    
    override init() {
        super.init()
        setNotification()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound,.list])
    }
    
    func setNotification() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (success, error) in
            if success == true {
                print("Request author done")
            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = "This is a notification"
        content.body = "Please check your phone"
        content.sound = UNNotificationSound.default
        
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        
        let uiidstring = UUID().uuidString
        let request = UNNotificationRequest(identifier: uiidstring, content: content, trigger: trigger)
        
        center.add(request) { error in
            //
        }
        
    }
}
