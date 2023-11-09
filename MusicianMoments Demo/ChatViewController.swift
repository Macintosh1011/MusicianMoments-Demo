//
//  ChatViewController.swift
//  MusicianMoments Demo
//
//  Created by Mishali Pandey on 11/1/23.
//

import UIKit
import MessageKit
import InputBarAccessoryView

struct Message: MessageType {
    public var sender: SenderType
    public var messageId: String
    public var sentDate: Date
    public var kind: MessageKind
}

extension MessageKind {
    var messageKindString: String {
        switch self {
        case .text(_):
            return "text"
        case .attributedText(_):
            return "attributed_text"
        case .photo(_):
            return "photo"
        case .video(_):
            return "video"
        case .location(_):
            return "location"
        case .emoji(_):
            return "emoji"
        case .audio(_):
            return "audio"
        case .contact(_):
            return "contact"
        case .custom(_):
            return "customc"
        case .linkPreview(_):
            return "link"
        }
    }
}

struct Sender: SenderType {
    public var photoURL: String
    public var senderId: String
    public var displayName: String
}

class ChatViewController: MessagesViewController {

    public static let dateFormatter: DateFormatter = {
        let formattre = DateFormatter()
        formattre.dateStyle = .medium
        formattre.timeStyle = .long
        formattre.locale = .current
        return formattre
    }()

    public let otherUserEmail: String
    public var isNewConversation = false

    private var messages = [Message]()

    private var selfSender: Sender? {
        guard let email = UserDefaults.standard.value(forKey: "email") as? String else {
            return nil
        }

        return Sender(photoURL: "",
                      senderId: email,
                      displayName: "Joe Smith")
    }
    
    private var otherSelfSender: Sender? {
       

        return Sender(photoURL: "",
                      senderId: "122343",
                      displayName: "Joe Smith")
    }

    init(with email: String) {
        self.otherUserEmail = email
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

       
        messages.append(Message(sender: currentSender, messageId: "1", sentDate: Date().addingTimeInterval(-66400), kind: .text("Hey, could you help me with he G flat scale?")))
        messages.append(Message(sender: otherSender, messageId: "2", sentDate: Date().addingTimeInterval(-46400), kind: .text("Yeah ofc")))
        messages.append(Message(sender: otherSender, messageId: "3", sentDate: Date().addingTimeInterval(-26400), kind: .text("Send me a video of what you have so far")))
  
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.reloadData()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        messageInputBar.inputTextView.becomeFirstResponder()
    }

}




extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
    
    var currentSender: MessageKit.SenderType {
        if let sender = selfSender {
            return sender
            
        }
        
        
        
        return Sender(photoURL: "", senderId: "2342343", displayName: "Daddy Khan")
    }
    
    var otherSender: MessageKit.SenderType {
        if let sender = otherSelfSender {
            return sender
            
        }
        
        
        
        return Sender(photoURL: "", senderId: "293847", displayName: "Idan Kestenbom")
    }
    


    }

extension ChatViewController: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        // Ensure there is text to send
        guard !text.isEmpty else {
            return
        }
    
        let newMessage = Message(sender: currentSender, messageId: UUID().uuidString, sentDate: Date(), kind: .text(text))
        
        // Add the new message to your messages array
        messages.append(newMessage)
        
        // Reload the collection view and scroll to the last item
        DispatchQueue.main.async {
            self.messagesCollectionView.reloadData()
            self.messagesCollectionView.scrollToLastItem()
        }
        
        // Clear the input text view
        inputBar.inputTextView.text = ""
    }

    
 }



