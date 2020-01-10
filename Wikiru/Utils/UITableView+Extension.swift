//
//  UITableView+Extension.swift
//  Wikiru
//
//  Created by Yamada Shunya on 2020/01/10.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

extension UITableView {
    
    enum State {
        case none
        case loading
        case empty(message: String?)
        case error(message: String?)
    }
    
    class StateView: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        init(frame: CGRect, state: State) {
            super.init(frame: frame)
            alpha = 0
            
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = .systemOrange
            imageView.alpha = 0.8
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            let label = UILabel()
            label.textColor = .systemGray
            label.font = .systemFont(ofSize: 16, weight: .light)
            label.numberOfLines = 0
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.distribution = .equalSpacing
            stackView.spacing = 4
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(imageView)
            stackView.addArrangedSubview(label)
            addSubview(stackView)
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalToConstant: 40),
                stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
                stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
                stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
            ])
            
            switch state {
            case .empty(let message):
                imageView.image = UIImage(systemName: "tray.fill")
                label.text = message
            case .error(let message):
                imageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
                imageView.tintColor = .systemRed
                label.text = message
                label.textColor = .systemRed
            case .loading:
                let indicator = UIActivityIndicatorView()
                indicator.startAnimating()
                stackView.addArrangedSubview(indicator)
            default:
                break
            }
            
            UIView.animate(withDuration: 0.3, animations: { self.alpha = 1 })
        }
    }
    
    func setState(_ state: State, separatorStyle: UITableViewCell.SeparatorStyle = .singleLine) {
        switch state {
        case .none:
            self.backgroundView = nil
            self.separatorStyle = separatorStyle
        case .loading, .empty, .error:
            self.backgroundView = StateView(frame: frame, state: state)
            self.separatorStyle = .none
        }
    }
}
