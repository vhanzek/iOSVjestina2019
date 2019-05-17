//
//  LoginUtils.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 02/05/2019.
//

import UIKit

struct Authorization {
    
    var accessToken: String?
    var userId: Int?
    
    init(accessToken: String, userId: Int) {
        self.accessToken = accessToken
        self.userId = userId
    }
}

class AuthorizationUtils {
    
    private static let TOKEN_KEY = "accessToken"
    private static let USER_ID = "userId"
    
    static func getUserId() -> Int {
        return UserDefaults.standard.integer(forKey: USER_ID)
    }
    
    static func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: TOKEN_KEY)
    }
    
    static func isUserLoggedIn() -> Bool {
        return getAccessToken() != nil
    }
    
    static func loginUser(auth: Authorization) {
        UserDefaults.standard.set(auth.accessToken, forKey: TOKEN_KEY)
        UserDefaults.standard.set(auth.userId, forKey: USER_ID)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.switchToQuizzesController()
    }
    
    static func logoutUser() {
        UserDefaults.standard.removeObject(forKey: TOKEN_KEY)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.switchToLoginController()
    }
    
}
