//
//  TestViewController.swift
//  BaneseDesignSystem
//
//  Created by Raul Rodrigo on 21/10/22.
//

import Foundation

import UIKit

class ViewController: UIViewController {
    
    private enum Strings {
        static let showActionButton = "Mostrar Action Button"
        static let enableTitle = "Ativar botão"
        static let disableTitle = "Desativar botão"
        static let toastSuccessMessage = "Botão funcionando com sucesso!"
        static let headLabelTitle = "Aqui está um titulo"
        static let bodyLabelTitle = "Aqui está um body"
        static let primaryColor = "Essa é a cor primária"
        static let secondaryColor = "Essa é a cor secundária"
        static let gradientButtonTitle = "Apenas um botão gradiente"
    }
    
    private lazy var showActionButton: BDSUIButton = {
        let button = BDSUIButton()
        button.setTitle(Strings.showActionButton, for: .normal)
        button.setup(buttonType: .solid)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTouch), for: .touchUpInside)
        return button
    }()
    
    private lazy var darkTitleLabel: BDSDynamicLabel = {
        let label = BDSDynamicLabel()
        label.setup(style: .darkTitle1_24, text: Strings.headLabelTitle, textAlignment: .center)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var darkBodyLabel: BDSDynamicLabel = {
        let label = BDSDynamicLabel()
        label.setup(style: .darkBody1_14, text: Strings.bodyLabelTitle, textAlignment: .center)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var primaryColorLabel: BDSDynamicLabel = {
        let label = BDSDynamicLabel()
        label.setup(style: .darkBody1_14, text: Strings.primaryColor, textAlignment: .center)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = BDSColor().backGroundPrimary
        return label
    }()
    
    private lazy var secondaryColorLabel: BDSDynamicLabel = {
        let label = BDSDynamicLabel()
        label.setup(style: .darkBody1_14, text: Strings.secondaryColor, textAlignment: .center)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = BDSColor().brandPrimary
        return label
    }()
    
    private lazy var enableActionButton: BDSUIButton = {
        let button = BDSUIButton()
        button.setTitle(Strings.disableTitle, for: .normal)
        button.setup(buttonType: .outline)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(changeButtonState), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
    }
    
    // MARK: - ACTIONS
    @objc func buttonTouch() {
        print("Button Touch")
    }
    
    @objc func changeButtonState() {
        showActionButton.isEnabled = !showActionButton.isEnabled
        enableActionButton.setTitle(showActionButton.isEnabled ? Strings.disableTitle : Strings.enableTitle, for: .normal)
    }
}

private extension ViewController {
    
    func setupHierarchy() {
        view.addSubview(darkTitleLabel)
        view.addSubview(darkBodyLabel)
        view.addSubview(primaryColorLabel)
        view.addSubview(secondaryColorLabel)
        view.addSubview(showActionButton)
        view.addSubview(enableActionButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            darkTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150.0),
            darkTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: BDSDimensions.Margins.bigMargin20),
            darkTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -BDSDimensions.Margins.bigMargin20),
            darkBodyLabel.topAnchor.constraint(equalTo: darkTitleLabel.bottomAnchor, constant: BDSDimensions.Margins.bigMargin20),
            darkBodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: BDSDimensions.Margins.bigMargin20),
            darkBodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -BDSDimensions.Margins.bigMargin20),
            
            
            primaryColorLabel.topAnchor.constraint(equalTo: darkBodyLabel.bottomAnchor, constant: BDSDimensions.Margins.bigMargin20),
            primaryColorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: BDSDimensions.Margins.bigMargin20),
            primaryColorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -BDSDimensions.Margins.bigMargin20),
            primaryColorLabel.heightAnchor.constraint(equalToConstant: 50.0),
            
            
            secondaryColorLabel.topAnchor.constraint(equalTo: primaryColorLabel.bottomAnchor, constant: BDSDimensions.Margins.bigMargin20),
            secondaryColorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: BDSDimensions.Margins.bigMargin20),
            secondaryColorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -BDSDimensions.Margins.bigMargin20),
            secondaryColorLabel.heightAnchor.constraint(equalToConstant: 50.0),
            
            
            showActionButton.topAnchor.constraint(equalTo: secondaryColorLabel.bottomAnchor, constant: BDSDimensions.Margins.biggestMargin48),
            showActionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showActionButton.widthAnchor.constraint(equalToConstant: 200),
            showActionButton.heightAnchor.constraint(equalToConstant: 200),
            
            
            enableActionButton.topAnchor.constraint(equalTo: showActionButton.bottomAnchor, constant: BDSDimensions.Margins.biggestMargin48),
            enableActionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enableActionButton.widthAnchor.constraint(equalToConstant: 200),
            enableActionButton.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}
