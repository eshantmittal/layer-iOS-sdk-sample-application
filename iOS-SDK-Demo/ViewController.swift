//
//  ViewController.swift
//  iOS-SDK-Demo
//
//  Created by Eshant Mittal on 25/06/20.
//  Copyright © 2020 Open. All rights reserved.
//

import UIKit
import OpenPaymentSDK

class ViewController: UIViewController,OpenPaymentDelegate {
   
    let paymentToken = "sb_pt_BRnS2ttBJTs3vte"
    let accessToken = "b0adaaa0-be66-11e9-ac5e-3d22d7faebc8"

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBAction func paymentButtonClick(_ sender: Any) {
        
        startPayment()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    func startPayment()
    {
        let openPayment = OpenPayment()
          .setBaseViewController(self.navigationController!)
          .setAccessToken(accessToken)
                           .setPaymentToken(paymentToken)
        .setEnvironment(environment:OpenPaymentSDK.NetworkEnvironment.SANDBOX)
                  .build()
        openPayment?.delegate = self
        openPayment?.startPayment()
       
    }
    
    func onError(message: String) {
        descriptionLabel.text = message
    }
       
    func onTransactionCompleted(transactionDetails: PaymentStatus) {
        DispatchQueue.main.async {
            self.descriptionLabel.text = "\(transactionDetails)"
        }
    }
}

