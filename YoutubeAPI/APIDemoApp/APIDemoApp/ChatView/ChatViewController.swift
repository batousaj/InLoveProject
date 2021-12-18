//
//  ChatViewController.swift
//  APIDemoApp
//
//  Created by Vu Thien on 18/12/2021.
//

import Foundation
import UIKit
import MessageKit

struct Sender : SenderType {
    var senderId:String
    var displayName:String
}

struct messageType : MessageType {
    var sender:SenderType
    var messageId:String
    var sentDate:Date
    var kind:MessageKind
}

class ChatViewController : MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    var message = [messageType]()
    var cunrentUser:Sender!
    var otherUser:Sender!
    
    func currentSender() -> SenderType {
        return cunrentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return message[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return message.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Message"
        navigationItem.titleView?.backgroundColor = .systemGray3
        navigationItem.backButtonTitle = " < "
        setupTable()
    }
    
    func setupTable() {
        
        cunrentUser = Sender(senderId: "self", displayName: "Batousaj")
        otherUser = Sender(senderId: "other", displayName: "Rainjto")
        
        message.append(
            messageType(sender: cunrentUser, messageId: "1", sentDate: Date().addingTimeInterval(10), kind: MessageKind.attributedText(NSAttributedString(string: "Hello")))
        )
        message.append(
            messageType(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(15), kind: MessageKind.attributedText(NSAttributedString(string:"Hi")))
        )
        message.append(
            messageType(sender: otherUser, messageId: "3", sentDate: Date().addingTimeInterval(20), kind: MessageKind.attributedText(NSAttributedString(string:"I'm Thien")))
        )
        message.append(
            messageType(sender: cunrentUser, messageId: "4", sentDate: Date().addingTimeInterval(25), kind: MessageKind.attributedText(NSAttributedString(string:"Nice to meet you")))
        )
        message.append(
            messageType(sender: cunrentUser, messageId: "5", sentDate: Date().addingTimeInterval(30), kind: MessageKind.attributedText(NSAttributedString(string:"I'm Trinh")))
        )
        
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.reloadData()
        
        messageInputBar.delegate = self
    }
    
}
