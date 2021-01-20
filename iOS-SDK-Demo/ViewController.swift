//
//  ViewController.swift
//  iOS-SDK-Demo
//
//  Created by Eshant Mittal on 25/06/20.
//  Copyright © 2020 Open. All rights reserved.
//

import UIKit
import LayerPayment

class ViewController: UIViewController,LayerPaymentDelegate {

    let paymentToken = "payment_token"
    let accessToken = "access_token"

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var paymentIdLabel: UILabel!
    @IBOutlet weak var tokenIdLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBAction func paymentButtonClick(_ sender: Any) {
        startPayment()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func startPayment()
    {
        let layerPayment = LayerPayment(paymentToken: paymentToken,accessKey: accessToken, environment: NetworkEnvironment.Sandbox)
        layerPayment.delegate = self
        layerPayment.setBaseViewController(self)
        layerPayment.startPayment()
    }
    
    func onPaymentCompleted(_ transactionDetails: TransactionDetails) {
        DispatchQueue.main.async {
            self.paymentIdLabel.text = "paymentId: \(transactionDetails.paymentId!)" //+ paymentId
            self.tokenIdLabel.text = "paymentTokenId: \(transactionDetails.paymentTokenId!)"
            self.statusLabel.text = "status: \(transactionDetails.status!)"
        }
    }
    
    func onPaymentError(_ error: String) {
        descriptionLabel.text = error
    }
}

