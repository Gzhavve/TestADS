//
//  PopUpView.swift
//  TestADS
//
//  Created by Sarah Hebert on 2020-11-07.
//

import Foundation
import UIKit

class PopUpView: UIView {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var scrollViewStackView: UIStackView!
    
    let nibName = "PopupXib"
    var contentView: UIView?
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
        guard let view = self.loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        
        //Observer for a button tap
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(notificationObserver(notification:)),
                                               name: .buttonTap,
                                               object: nil)
    }
    
    func loadViewFromNib() -> UIView? {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    @IBAction func buttonTap() {
        
        NotificationCenter.default.post(name: .buttonTap, object: nil)
    }
    
    @objc private func notificationObserver(notification: NSNotification) {
        
        self.addDateLabel(notification: notification)
    }
}

//MARK: DateLabelProtocol Extension
extension PopUpView: DateLabelProtocol {
    
    var stackView: UIStackView? {
        get {
            return self.scrollViewStackView
        }
    }
}
