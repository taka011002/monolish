//
//  parentViewController.swift
//  monolith
//
//  Created by Takahiro Ishitsuka  on 2019/07/10.
//  Copyright © 2019 Taka. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    func parentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil }
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            parentResponder = nextResponder
        }
    }
}

