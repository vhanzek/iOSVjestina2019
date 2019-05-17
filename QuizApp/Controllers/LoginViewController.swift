//
//  LoginViewController.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 12/04/2019.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIStackView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        setupKeyboard()
    }
    
    @IBAction func userLogin(_ sender: Any) {
        LoginService().login(
            username: usernameTextField.text ?? "",
            password: passwordTextField.text ?? "",
            completion: { (authorization) in
                DispatchQueue.main.async {
                    if let authorization = authorization {
                        AuthorizationUtils.loginUser(auth: authorization)
                    } else {
                        self.errorLabel.isHidden = false
                    }
                }
        })
    }
}
    
extension LoginViewController {
    
    private func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardHeight = getKeyboardHeight(notification: notification) {
            let overlap = keyboardHeight - getContentViewBottomMargin()
            if overlap > 0 && view.frame.origin.y == 0 {
                self.view.frame.origin.y -= overlap
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    private func getKeyboardHeight(notification: NSNotification) -> CGFloat? {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            return keyboardHeight
        }
        return nil
    }
    
    private func getContentViewBottomMargin() -> CGFloat {
        return view.frame.size.height - (contentView.frame.size.height + contentView.frame.origin.y)
    }
    
    
}


