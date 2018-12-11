//
//  MyPasswordUIValidation.swift
//  SmileLock-Example
//
//  Created by rain on 4/22/16.
//  Copyright © 2016 RECRUIT LIFESTYLE CO., LTD. All rights reserved.
//

import UIKit
import SmileLock

class MyPasswordModel {
  class func match(_ password: String) -> Bool {
    return password == "1234"
  }
}

class MyPasswordUIValidation: PasswordUIValidation {
  init(in stackView: UIStackView) {
    super.init(in: stackView, digit: 4)
    validation = { password in
      MyPasswordModel.match(password)
    }
  }
  
  //handle Touch ID
  override func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: Error?) {
    if success {
      self.success?("")
    } else {
      passwordContainerView.clearInput()
    }
  }
}
