//
//  PurchaseViewController.swift
//  IAPExercise133
//
//  Created by Mike Laursen on 8/30/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

import StoreKit
import UIKit

class PurchaseViewController: UIViewController, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    @IBOutlet private weak var productTitle: UILabel!
    @IBOutlet private weak var productDescription: UITextView!
    @IBOutlet private weak var purchaseButton: UIButton!
    @IBOutlet private weak var purchaseMessages: UITextView!
    
    let productID = "com.appamajigger.IAPExercise133.Level2"
    var product: SKProduct?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        purchaseButton.isEnabled = false
        SKPaymentQueue.default().add(self)
        makeProductsRequest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction private func buy(_ sender: UIButton) {
        let payment = SKPayment(product: product!) // TODO: Doesn't "product" need to be initialized?
        SKPaymentQueue.default().add(payment)
    }
        
    func makeProductsRequest() {
        if SKPaymentQueue.canMakePayments() {
            let productIdentifiers: Set<String> = [self.productID]
            let productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
            productsRequest.delegate = self
            productsRequest.start()
        } else {
            purchaseButton.isEnabled = false
            productTitle.text = "Level 2 Not Allowed"
            productDescription.text = "In-App Purchases are restricted on this device."
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
                (UIApplication.shared.delegate as! AppDelegate).isLevel2Locked = false
                makeProductsRequest()
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
            default:
                break
            }
        }
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if response.products.count > 0 {
            (UIApplication.shared.delegate as! AppDelegate).isLevel2Locked = false
            purchaseButton.isEnabled = true
            productTitle.text = response.products[0].localizedTitle
            productDescription.text = response.products[0].localizedDescription
        } else {
            (UIApplication.shared.delegate as! AppDelegate).isLevel2Locked = true
            purchaseButton.isEnabled = false
            productTitle.text = "Level 2 Not Available"
            productDescription.text = "No In-App Purchases are available for this app at this time."
        }
        
        for product in response.invalidProductIdentifiers {
            print("Product not found: \(product)")
        }
    }
}
