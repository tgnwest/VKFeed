//
//  AuthService.swift
//  VKFeed
//
//  Created by Alex Tregubov on 01.06.2020.
//  Copyright © 2020 Alex Tregubov. All rights reserved.
//

import Foundation
import VKSdkFramework

protocol AuthServiceDelegate: class {
    
    func authServiceShouldShow(viewController: UIViewController)
    func authServiceSignIn()
    func authServiceSignInDidFail()
    
}

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    
    private let appId = "7493593"
    private let vkSdk: VKSdk
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("VKsdk.init")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func wakeUpSession() {
        let scope = ["offline"]
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            switch state {
            case .initialized:
                print("init")
                VKSdk.authorize(scope)
            case .authorized:
                print("auth")
                delegate?.authServiceSignIn()
            default:
                delegate?.authServiceSignInDidFail()
            }
        }
    }
    
    weak var delegate: AuthServiceDelegate?
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            delegate?.authServiceSignIn()
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
        delegate?.authServiceSignInDidFail()
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(viewController: controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
}
