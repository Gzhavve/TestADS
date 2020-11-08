//
//  MenuViewController.swift
//  TestADS
//
//  Created by Sarah Hebert on 2020-11-07.
//

import UIKit

class MenuViewController: UIViewController {
    
    var globalStackView: UIStackView!
    var button: UIButton!
    var scrollView: UIScrollView!
    var scrollViewStackView: UIStackView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
        
        //Observer for a button tap
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(notificationObserver(notification:)),
                                               name: .buttonTap,
                                               object: nil)
        
        self.initalizeStackView()
        self.initializeButton()
        self.initializeScrollView()
        self.initializeScrollViewStackView()
    }
    
    //Create the root stack view
    private func initalizeStackView() {
        
        self.globalStackView = UIStackView()
        self.globalStackView.axis = .vertical
        self.globalStackView.alignment = .fill
        self.globalStackView.distribution = .fill
        self.globalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.globalStackView)
        
        let topAnchor = self.globalStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 48)
        let leftAnchor = self.globalStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8)
        let rightAnchor = self.globalStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8)
        let height = self.globalStackView.heightAnchor.constraint(equalToConstant: 183)
        NSLayoutConstraint.activate([topAnchor, leftAnchor, rightAnchor, height])
    }
    
    private func initializeButton() {
        
        self.button = UIButton()
        self.button.setTitle("Button", for: .normal)
        self.button.titleLabel?.font = UIFont(name: "System", size: 15)
        self.button.setTitleColor(.white, for: .normal)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.addTarget(self, action: #selector(self.buttonTap), for: .touchUpInside)
        
        self.globalStackView.addArrangedSubview(self.button)
    }
    
    private func initializeScrollView() {
        
        self.scrollView = UIScrollView()
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.globalStackView.addArrangedSubview(self.scrollView)
        
        let bottomAnchor = self.scrollView.bottomAnchor.constraint(equalTo: self.globalStackView.bottomAnchor)
        NSLayoutConstraint.activate([bottomAnchor])
    }
    
    //Create the stack view where the date label will be added
    private func initializeScrollViewStackView() {
        
        self.scrollViewStackView = UIStackView()
        self.scrollViewStackView.axis = .vertical
        self.scrollViewStackView.alignment = .fill
        self.scrollViewStackView.distribution = .fill
        self.scrollViewStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "UIScrollView"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollViewStackView.addArrangedSubview(label)
        
        self.scrollView.addSubview(self.scrollViewStackView)
        
        let topAnchor =  self.scrollViewStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let leftAnchor = self.scrollViewStackView.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor)
        let widthAnchor = self.scrollViewStackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        let bottomAnchor = self.scrollViewStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        NSLayoutConstraint.activate([topAnchor, leftAnchor, widthAnchor, bottomAnchor])
    }
    
    @IBAction func buttonTap() {
        
        NotificationCenter.default.post(name: .buttonTap, object: nil)
    }
    
    @objc private func notificationObserver(notification: NSNotification) {
        
        self.addDateLabel(notification: notification)
    }
}

//MARK: DateLabelProtocol Extension
extension MenuViewController: DateLabelProtocol {
    
    var stackView: UIStackView? {
        get {
            return self.scrollViewStackView
        }
    }
}
