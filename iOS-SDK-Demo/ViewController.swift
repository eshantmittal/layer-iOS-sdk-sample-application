//
//  ViewController.swift
//  iOS-SDK-Demo
//
//  Created by Eshant Mittal on 25/06/20.
//  Copyright © 2020 Open. All rights reserved.
//

import UIKit
import OpenPayment

class ViewController: UIViewController,OpenPaymentDelegate {
    
    let paymentToken = "payment_token"
    let accessToken = "access_token"
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var paymentIdLabel: UILabel!
    @IBOutlet weak var tokenIdLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBAction func paymentButtonClick(_ sender: Any) {
        setupEnvirnment()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupEnvirnment() {
        let openPaymentBuilderObj = OpenPaymentBuilder()
        openPaymentBuilderObj.setAccessKey(accessToken)
        openPaymentBuilderObj.setEnvironment(.UAT)
        openPaymentBuilderObj.setErrorColor("#4166B0")
        openPaymentBuilderObj.setPaymentToken(paymentToken)
        let openPaymentOBj = openPaymentBuilderObj.buildObject()
        openPaymentOBj.delegate = self
        openPaymentOBj.setBaseViewController(self)
        openPaymentOBj.startPayment()
    }
    
    func onPaymentCompleted(_ transactionDetails: TransactionDetails) {
        DispatchQueue.main.async {
            self.paymentIdLabel.text = "paymentId: \(transactionDetails.paymentId ?? "")" //+ paymentId
            self.tokenIdLabel.text = "paymentTokenId: \(transactionDetails.paymentTokenId ?? "")"
            self.statusLabel.text = "status: \(transactionDetails.status ?? "")"
        }
    }
    
    func onPaymentError(_ error: String) {
        descriptionLabel.text = error
    }
}

