//
//  PurchaseViewController.swift
//  IAPExercise133
//
//  Created by Mike Laursen on 8/30/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

import StoreKit
import UIKit

class PurchaseViewController: UIViewController, SKPaymentTransactionObserver {
    @IBOutlet private weak var productTitle: UILabel!
    @IBOutlet private weak var productDescription: UITextView!
    @IBOutlet private weak var purchaseButton: UIButton!
    @IBOutlet private weak var purchaseMessages: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
        SKPaymentQueue.default().add(self)
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
    
    // MARK: - StoreKit

    @IBAction private func buy(_ sender: UIButton) {
        let product = (UIApplication.shared.delegate as! AppDelegate).level2Product
        
        if product != nil {
            let payment = SKPayment(product: product!)
            SKPaymentQueue.default().add(payment)
        }
    }

    // TODO: Can we make this private?
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .deferred:
                purchaseMessages.text = purchaseMessages.text + "\nPurchase deferred."
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                purchaseMessages.text = purchaseMessages.text + "\nPurchase failed."
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
                (UIApplication.shared.delegate as! AppDelegate).isLevel2Locked = false
                let userDefaults = UserDefaults.standard
                userDefaults.set(false, forKey: "Level2Locked")
                userDefaults.synchronize()
                purchaseMessages.text = purchaseMessages.text + "\nPurchase successful!"
            case .purchasing:
                purchaseMessages.text = purchaseMessages.text + "\nPurchasing..."
            case .restored:
                purchaseMessages.text = purchaseMessages.text + "\nPurchase restored."
            }
        }
        
        updateView()
    }
    
    // MARK: - Utility
    
    private func updateView() {
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.makeProductsRequest()
        
        if appDelegate.level2Product != nil {
            productTitle.text = appDelegate.level2Product!.localizedTitle
            productDescription.text = appDelegate.level2Product!.localizedDescription
        } else {
            productTitle.text = "Level 2 (Not Found)"
            productDescription.text = "Could not find product information."
        }
        
        let canMakePayments = SKPaymentQueue.canMakePayments()
        
        if !canMakePayments {
            purchaseMessages.text = purchaseMessages.text + "\nIn-App purchases are restricted on this device."
        }
        
        purchaseButton.isEnabled = (UIApplication.shared.delegate as! AppDelegate).isLevel2Locked && canMakePayments
    }
}
