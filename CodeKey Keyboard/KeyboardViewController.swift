//
//  KeyboardViewController.swift
//  CodeKey Keyboard
//
//  Created by Wilka Hudson on 27/12/2021.
//

import UIKit
import SwiftUI


class KeyboardViewController: UIInputViewController {
    @IBOutlet var nextKeyboardButton: UIButton!
  
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Lifted from https://stackoverflow.com/a/65351381/1367
        let hostingController = UIHostingController(rootView: KeyboardView(viewController: self))
        view.addSubview(hostingController.view)
        addChild(hostingController)
        
        
        // Next keyboard stuff
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        /*
        
        let rowOfKeys = [buildKeyboardRow(letters: "QWERTYUIOP"),
                                   buildKeyboardRow(letters: "ASDFGHJKL"),
                                   buildKeyboardRow(letters: "ZXCVBNM,./")]
        
        var rows = [UIStackView]()
        
        var rowHightlight = true
        
        for keyRow in rowOfKeys {
            let row = UIStackView(arrangedSubviews: keyRow)
            // TODO: Trying to control the size of the buttons, but nothing is working
            row.frame.size = CGSize(width: 100, height: 1000)
            row.backgroundColor = rowHightlight ? .blue : .darkGray
            rowHightlight = !rowHightlight
          //  row.layer.borderWidth = 2
            //row.sizeToFit()
            row.translatesAutoresizingMaskIntoConstraints = false
            rows.append(row)
        }

        
        let column = UIStackView(arrangedSubviews: rows)
        column.axis = .vertical
        //column.sizeToFit()
        
        column.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.view.addSubview(column)
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        column.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        column.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
         */
    }
    
    func buildKeyboardRow(letters: String) -> [UIButton] {
        var buttons = [UIButton]()
        // Wilka: you probably need to make a view for the button, cos it's going to have a lot of logic going on. Is that even the correct
        // way to break things down in SwiftUI?
        for c in letters {
            let keyText = String(c)
            let thisButton = PassableUIButton()
            thisButton.params["text"] = keyText
            thisButton.setTitle(keyText, for: [])
            thisButton.setTitleColor(.red, for: [])
            thisButton.frame.size = CGSize(width: 100, height: 100)
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
