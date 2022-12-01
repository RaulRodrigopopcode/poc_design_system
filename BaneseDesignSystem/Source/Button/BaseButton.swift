//
//  BaseButton.swift
//  BaneseDesignSystem
//
//  Created by Raul Rodrigo on 20/10/22.
//

import UIKit

public class BDSBaseButton: UIButton {
    
    // MARK: - Class Properties
    private var timer: Timer?
    private var textButton: String = ""
    
    // MARK: - Public Class Properties
    internal var indicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
    internal var defaultBackgroundColor: UIColor?
    internal var defaultTintColor: UIColor?
    internal var defaultBorderColor: CGColor?
    internal var disabledBackgroundColor: UIColor?
    internal var disabledTintColor: UIColor?
    internal var disabledBorderColor: CGColor?
    
    /// used to share view
    public weak var viewController: UIViewController?
    
    override public var isEnabled: Bool {
        didSet {
            setDisable(disabled: !isEnabled)
        }
    }
    
    //MARK: Constants
    private enum Constants {
        static let buttonCornerRadius: CGFloat = 10.0
        static let buttonHeight: CGFloat = 50.0
    }
    
    //MARK: LifeCycle
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        customConfigs()
        defaultConfigs()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customConfigs()
        defaultConfigs()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setUpIndicatorView()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Initialize Functions
    private func defaultConfigs() {
        setDisable(disabled: false)
        titleLabel?.font = .buttonTitle
        titleLabel?.textAlignment = .center
        layer.masksToBounds = true
        layer.cornerRadius = Constants.buttonCornerRadius
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Constants.buttonHeight)
        ])
    }
    
    internal func updateLayout() {
        setDisable(disabled: !isEnabled)
    }
    
    internal func customConfigs() {
        fatalError("Overrinding \"customConfigs\" func pending...")
    }
    
    //MARK: Public Functions
    
    public func setCustomTitle(text: String) {
        self.textButton = text
        self.setTitle(text, for: .normal)
    }
    
    //MARK: Functions
    
    private func setUpIndicatorView() {
        let buttonHeight = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        let centerPoint = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
        
        indicatorView.center = centerPoint
        indicatorView.hidesWhenStopped = true
        
        self.addSubview(indicatorView)
    }
    
    private func setDisable(disabled: Bool) {
        if disabled {
            setTitleColor(disabledTintColor, for: .normal)
            backgroundColor = disabledBackgroundColor
        } else {
            setTitleColor(defaultTintColor, for: .normal)
            backgroundColor = defaultBackgroundColor
        }
        
        layoutIfNeeded()
    }
    
    public func loadingIndicator(show: Bool) {
        if show {
            if let timer = timer {
                timer.invalidate()
            }
            self.isUserInteractionEnabled = false
            self.textButton = self.titleLabel?.text ?? ""
            self.setTitle("", for: .normal)
            indicatorView.startAnimating()
        } else {
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                self.isUserInteractionEnabled = true
            }
            
            self.setTitle(self.textButton, for: .normal)
            indicatorView.stopAnimating()
        }
    }
    
    func addShadow(color: UIColor = .black, offSet: CGSize = CGSize(width: 1.0, height: 2.0),
                   opacity: Float = 0.4, radius: CGFloat = 4) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offSet
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}
