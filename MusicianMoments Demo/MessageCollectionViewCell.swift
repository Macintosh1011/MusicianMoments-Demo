import UIKit

class MessageCollectionViewCell: UIViewController {
    let messageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type your message..."
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // Chat area to display messages (a UITextView in this example)
    let chatTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // Send button (non-functional in this example)
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add UI elements to the view
        view.addSubview(chatTextView)
        view.addSubview(messageTextField)
        view.addSubview(sendButton)
        
        // Constrain UI elements
        NSLayoutConstraint.activate([
            messageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            messageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -8),
            messageTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sendButton.bottomAnchor.constraint(equalTo: messageTextField.bottomAnchor),
            
            chatTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            chatTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            chatTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            chatTextView.bottomAnchor.constraint(equalTo: messageTextField.topAnchor, constant: -8),
        ])
    }
}

