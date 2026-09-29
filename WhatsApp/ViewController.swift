//
//  ViewController.swift
//  WhatsApp
//
//  Created by jatin foujdar on 29/09/26.
//

import UIKit

class ViewController: UIViewController {

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Hello Programmatic Ui"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        view.addSubview(titleLabel)
    
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

