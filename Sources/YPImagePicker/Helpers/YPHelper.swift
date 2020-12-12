//
//  YPHelper.swift
//  YPImgePicker
//
//  Created by Sacha Durand Saint Omer on 02/11/16.
//  Copyright © 2016 Yummypets. All rights reserved.
//

import Foundation
import UIKit
import Photos

internal func ypLocalized(_ str: String) -> String {
    return NSLocalizedString(str,
                             tableName: "YPImagePickerLocalizable",
                             bundle: .module,
                             value: "",
                             comment: "")
}

internal func imageFromBundle(_ named: String) -> UIImage {
    return UIImage(named: named, in: .module, compatibleWith: nil) ?? UIImage()
}

struct YPHelper {
    static func configureNavigationBarUI(controller: UIViewController, backButtonIcon: UIImage) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .systemBackground
        navBarAppearance.backgroundImage = UIImage()
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.shadowColor = .clear
        navBarAppearance.setBackIndicatorImage(backButtonIcon, transitionMaskImage: backButtonIcon)
        controller.navigationController?.navigationBar.isTranslucent = false
        controller.navigationController?.navigationBar.standardAppearance = navBarAppearance
        controller.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }

    static func changeBackButtonIcon(_ controller: UIViewController) {
        configureNavigationBarUI(controller: controller, backButtonIcon: YPConfig.icons.backButtonIcon)
    }
    
    static func changeBackButtonTitle(_ controller: UIViewController) {
        if YPConfig.icons.hideBackButtonTitle {
            controller.navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                                          style: .plain,
                                                                          target: nil,
                                                                          action: nil)
        }
    }
    
    static func configureFocusView(_ v: UIView) {
        v.alpha = 0.0
        v.backgroundColor = UIColor.clear
        v.layer.borderColor = UIColor.ypSecondaryLabel.cgColor
        v.layer.borderWidth = 1.0
        v.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
    
    static func animateFocusView(_ v: UIView) {
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 3.0, options: UIView.AnimationOptions.curveEaseIn,
                       animations: {
                        v.alpha = 1.0
                        v.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }, completion: { _ in
            v.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            v.removeFromSuperview()
        })
    }
    
    static func formattedStrigFrom(_ timeInterval: TimeInterval) -> String {
        let interval = Int(timeInterval)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
