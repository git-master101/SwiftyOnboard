//
//  customOverlayView.swift
//  SwiftyOnboard
//
//  Created by Jay on 3/26/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

struct ScreenSize {
  static let width = UIScreen.main.bounds.size.width
  static let height = UIScreen.main.bounds.size.height
  static let frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height)
  static let maxWH = max(ScreenSize.width, ScreenSize.height)
}

struct DeviceType {
    static let iPhone4orLess = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxWH < 568.0
    static let iPhone5orSE   = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxWH == 568.0
    static let iPhone678     = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxWH == 667.0
    static let iPhone678p    = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxWH == 736.0
    static let iPhoneX       = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxWH == 812.0
    static let iPhoneXSMax   = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxWH == 896.0
    static var hasNotch: Bool {
        return iPhoneX || iPhoneXSMax
    }
}
    
open class SwiftyOnboardOverlay: UIView {
    
    open var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        return pageControl
    }()
    
    open var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "DUA_SIGNUP_NEXT_BUTTON_ENABLED")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    open var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SKIP", for: .normal)
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews {
            if !subview.isHidden && subview.alpha > 0 && subview.isUserInteractionEnabled && subview.point(inside: convert(point, to: subview), with: event) {
                return true
            }
        }
        return false
    }
    
    open func set(style: SwiftyOnboardStyle) {
        switch style {
        case .light:
            continueButton.setTitleColor(.white, for: .normal)
            pageControl.currentPageIndicatorTintColor = UIColor.white
        case .dark:
            continueButton.setTitleColor(.black, for: .normal)
            pageControl.currentPageIndicatorTintColor = UIColor.black
        }
    }
    
    open func page(count: Int) {
        pageControl.numberOfPages = count
    }
    
    open func currentPage(index: Int) {
        pageControl.currentPage = index
    }
    
    func setUp() {
        self.addSubview(pageControl)
        
        let margin = self.layoutMarginsGuide
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.heightAnchor.constraint(equalToConstant: 15).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: (DeviceType.hasNotch) ? -16 : -24).isActive = true
        pageControl.leftAnchor.constraint(equalTo: margin.leftAnchor, constant: 10).isActive = true
        pageControl.rightAnchor.constraint(equalTo: margin.rightAnchor, constant: -10).isActive = true
        
        self.addSubview(continueButton)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: 36.5).isActive = true
        continueButton.rightAnchor.constraint(equalTo: margin.rightAnchor, constant: -16).isActive = true
        
        self.addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        skipButton.topAnchor.constraint(equalTo: margin.topAnchor, constant: 0).isActive = true
        skipButton.leftAnchor.constraint(equalTo: margin.leftAnchor, constant: 10).isActive = true
        skipButton.rightAnchor.constraint(equalTo: margin.rightAnchor, constant: -20).isActive = true
    }
    
}
