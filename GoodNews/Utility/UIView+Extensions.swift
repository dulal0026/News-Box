//
//  UIView+Extensions.swift
//  GoodNews
//
//  Created by user on 10/9/22.
//

import UIKit

extension UIView {
    
    func fitContraintsToParent(insets: UIEdgeInsets = .zero) {
        guard let parent = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: insets.right),
            topAnchor.constraint(equalTo: parent.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: insets.bottom)
            ])
    }
   
    func constraintsToTop(insets:UIEdgeInsets = UIEdgeInsets.zero){
        guard let parent = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: insets.left).isActive = true

        trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: insets.right).isActive = true
        
        topAnchor.constraint(equalTo: parent.topAnchor, constant: insets.top).isActive = true
    }
    
    func constraintsToTop(parent: UIView,insets:UIEdgeInsets = UIEdgeInsets.zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: insets.left).isActive = true

        trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: insets.right).isActive = true
        
        topAnchor.constraint(equalTo: parent.topAnchor, constant: insets.top).isActive = true
    }
    
    func constraintsToBottom(insets:UIEdgeInsets = UIEdgeInsets.zero){
        guard let parent = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: insets.left).isActive = true

        trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: insets.right).isActive = true
        
        bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: insets.bottom).isActive = true
    }
    func constraintsToBottom(parent: UIView,insets:UIEdgeInsets = UIEdgeInsets.zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: insets.left).isActive = true

        trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: insets.right).isActive = true
        
        bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: insets.bottom).isActive = true
    }
    
    func constraintsToLeft(insets:UIEdgeInsets = UIEdgeInsets.zero){
        guard let parent = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: insets.left).isActive = true

        topAnchor.constraint(equalTo: parent.topAnchor, constant: insets.top).isActive = true
        
        bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: insets.bottom).isActive = true
    }
    func constraintsToLeft(parent: UIView,insets:UIEdgeInsets = UIEdgeInsets.zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: insets.left).isActive = true

        topAnchor.constraint(equalTo: parent.topAnchor, constant: insets.top).isActive = true

        bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: insets.bottom).isActive = true
    }
    
    func constraintsToRight(insets:UIEdgeInsets = UIEdgeInsets.zero){
        guard let parent = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: insets.right).isActive = true

        topAnchor.constraint(equalTo: parent.topAnchor, constant: insets.top).isActive = true
        
        bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: insets.bottom).isActive = true
    }
    func constraintsToRight(parent: UIView,insets:UIEdgeInsets = UIEdgeInsets.zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: insets.right).isActive = true

        topAnchor.constraint(equalTo: parent.topAnchor, constant: insets.top).isActive = true

        bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: insets.bottom).isActive = true
    }
}

