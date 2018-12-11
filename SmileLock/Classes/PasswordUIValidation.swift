//
//  PasswordUIValidation.swift
//
//  Created by rain on 4/21/16.
//  Copyright © 2016 Recruit Lifestyle Co., Ltd. All rights reserved.
//

import UIKit

open class PasswordUIValidation<T>: PasswordInputCompleteProtocol {
  public typealias Failure    = (UInt) -> Void
  public typealias Success    = (String) -> Void
  public typealias Validation = (String) -> Bool
  
  open var failure: Failure?
  open var success: Success?
  
  open var validation: Validation?
  
  open var view: PasswordContainerView!
  
  private var tries: UInt = 0
  
  public init(in stackView: UIStackView, width: CGFloat? = nil, digit: Int) {
    view = PasswordContainerView.create(in: stackView, digit: digit)
    view.delegate = self
    guard let width = width else { return }
    view.width = width
  }
  
  open func resetUI() {
    tries = 0
    view.clearInput()
  }
  
  // MARK: - PasswordInputCompleteProtocol
  open func passwordInputComplete(_ passwordContainerView: PasswordContainerView, input: String) {
    if let validation = validation, validation(input) {
      success?(input)
    } else {
      passwordContainerView.wrongPassword()
      tries += 1
      failure?(tries)
    }
  }
  
  open func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: Error?) {}
}
