//
//  KeyboardViewController.swift
//  CodeKey Keyboard
//
//  Created by Wilka Hudson on 27/12/2021.
//

import UIKit

class KeyboardViewController: UIInputViewController {


    @IBOutlet var nextKeyboardButton: UIButton!
  
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
        
        let qRow = UIStackView(arrangedSubviews: addFirstRow())
        qRow.sizeToFit()
        qRow.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.view.addSubview(qRow)
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        qRow.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        qRow.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        // For the overall layout, it feels having a row per row of keys would work. Then stuff just needs to fit left -> right in each row. You can add spacing at the start of a row to ident the 'a' row a little. Or mayve just add a padding item, then you can also use that after the shift before teh 'z'
        
    }
    
    func addFirstRow() -> [UIButton] {
        let letters = "QWERTYUIOP";
        var buttons = [UIButton]()
        
        for c in letters {
            let keyText = String(c)
            let thisButton = PassableUIButton()
            thisButton.params["text"] = keyText
            thisButton.setTitle(keyText, for: [])
            thisButton.sizeToFit()
            thisButton.translatesAutoresizingMaskIntoConstraints = false
            thisButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
            
            buttons.append(thisButton)
        }
        
        return buttons
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
    
    @objc func tapButton(sender: PassableUIButton) {
        self.textDocumentProxy.insertText(sender.params["text"] as! String)
    }
}
