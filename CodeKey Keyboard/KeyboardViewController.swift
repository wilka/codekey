//
//  KeyboardViewController.swift
//  CodeKey Keyboard
//
//  Created by Wilka Hudson on 27/12/2021.
//

import UIKit

class KeyboardViewController: UIInputViewController {


    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var textInput: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.textInput = UIButton(type: .system)
        self.textInput.setTitle("Q", for: [])
        self.textInput.sizeToFit()
        self.textInput.translatesAutoresizingMaskIntoConstraints = false
        self.textInput.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        self.view.addSubview(self.textInput)
        self.view.addSubview(self.nextKeyboardButton)
        
        self.textInput.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.textInput.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    @objc func tapButton() {
        self.textDocumentProxy.insertText("Q")
    }
}
