//
//  customPageView.swift
//  SwiftyOnboard
//
//  Created by Jay on 3/25/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

open class SwiftyOnboardPage: UIView {
    
    public var title: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    public var subTitle: UILabel = {
        let label = UILabel()
        label.text = "Sub Title"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    public var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    func set(style: SwiftyOnboardStyle) {
        switch style {
        case .light:
            title.textColor = .white
            subTitle.textColor = .white
        case .dark:
            title.textColor = UIColor(red: 0.255, green: 0.255, blue: 0.251, alpha: 1)
            subTitle.textColor = UIColor(red: 0.63, green: 0.63, blue: 0.654, alpha: 1)
        }
    }
    
    func setUp() {
        self.addSubview(imageView)
        
        let margin = self.layoutMarginsGuide
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: margin.leftAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: margin.rightAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: margin.topAnchor, constant: 60).isActive = true
        if UIDevice().userInterfaceIdiom == .phone {

            switch UIScreen.main.nativeBounds.height {
            case 1136:
                 imageView.heightAnchor.constraint(equalTo: margin.heightAnchor, multiplier: 0.45).isActive = true
            case 1334:
                 imageView.heightAnchor.constraint(equalTo: margin.heightAnchor, multiplier: 0.52).isActive = true
            case 1920, 2208:
                 imageView.heightAnchor.constraint(equalTo: margin.heightAnchor, multiplier: 0.52).isActive = true
            case 2436:
                 imageView.heightAnchor.constraint(equalTo: margin.heightAnchor, multiplier: 0.59).isActive = true
            case 2688:
                 imageView.heightAnchor.constraint(equalTo: margin.heightAnchor, multiplier: 0.59).isActive = true
            case 1792:
                 imageView.heightAnchor.constraint(equalTo: margin.heightAnchor, multiplier: 0.59).isActive = true
            default:
                 imageView.heightAnchor.constraint(equalTo: margin.heightAnchor, multiplier: 0.59).isActive = true
            }
        }
        
        self.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leftAnchor.constraint(equalTo: margin.leftAnchor, constant: 16).isActive = true
        title.rightAnchor.constraint(equalTo: margin.rightAnchor, constant: -16).isActive = true
        title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 28).isActive = true
        title.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(subTitle)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.leftAnchor.constraint(equalTo: margin.leftAnchor, constant: 16).isActive = true
        subTitle.rightAnchor.constraint(equalTo: margin.rightAnchor, constant: -16).isActive = true
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: -3).isActive = true

    }
}
