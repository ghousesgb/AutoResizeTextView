//
//  ViewController.swift
//  AutoResizeTextField
//
//  Created by Ghouse Basha Shaik on 10/06/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let textView = UITextView.init(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        textView.backgroundColor = UIColor.gray
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.preferredFont(forTextStyle: .headline)
        [
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 50)
        ].forEach({$0.isActive = true})
        textView.isScrollEnabled = false
        textView.delegate = self
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let completeSize = CGSize(width: view.frame.width, height: .infinity)
        let estimationSize = textView.sizeThatFits(completeSize)
        textView.constraints.forEach {(constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimationSize.height
            }
        }
    }
}
