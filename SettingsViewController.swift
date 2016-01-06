//
//  SettingsViewController.swift
//  iLife Count
//
//  Created by Dominick Hera on 3/11/15.
//  Copyright (c) 2015 Posa. All rights reserved.
//

import UIKit
import StoreKit

class SettingsViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {

    @IBOutlet weak var removeAds: UIButton!
    @IBOutlet weak var restorePurchases: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removeAds.enabled = false
        
        // Set IAPS
        if(SKPaymentQueue.canMakePayments()) {
            println("IAP is enabled, loading")
            var productID:NSSet = NSSet(objects: "Posa.LifeCount.iap.removeads")
            var request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID)
            request.delegate = self
            request.start()
        } else {
            println("please enable IAPS")
        }
        

        // Do any additional setup after loading the view.
    }
    @IBAction func shareAction(sender: AnyObject) {
        let sc = UIActivityViewController(activityItems: [" You should check out this cool app called Life Count. It's perfect for managing your health points in Magic. You can find the app at"], applicationActivities: nil)
        self.presentViewController(sc, animated: true, completion: nil)
    }

    @IBAction func removeAdsAction(sender: UIButton) {
        
        for product in list {
            var prodID = product.productIdentifier
            if(prodID == "Posa.LifeCount.iap.removeads") {
                p = product
                buyProduct()
                break;
            }
        }
    
    }
    
    @IBAction func restorePurchasesAction(sender: UIButton) {
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        SKPaymentQueue.defaultQueue().restoreCompletedTransactions()
    }
    
    // 1
    var list = [SKProduct]()
    var p = SKProduct()
    
    // 2
    func buyProduct() {
        println("buy " + p.productIdentifier)
        var pay = SKPayment(product: p)
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        SKPaymentQueue.defaultQueue().addPayment(pay as SKPayment)
    }
    
    //3
    func productsRequest(request: SKProductsRequest!, didReceiveResponse response: SKProductsResponse!) {
        println("product request")
        var myProduct = response.products
        
        for product in myProduct {
            println("product added")
            println(product.productIdentifier)
            println(product.localizedTitle)
            println(product.localizedDescription)
            println(product.price)
            
            list.append(product as SKProduct)
        }
        
        removeAds.enabled = true
        }
    
    // 4
    func paymentQueueRestoreCompletedTransactionsFinished(queue: SKPaymentQueue!) {
        println("transactions restored")
        
        var purchasedItemIDS = []
        for transaction in queue.transactions {
            var t: SKPaymentTransaction = transaction as SKPaymentTransaction
            
            let prodID = t.payment.productIdentifier as String
            
            switch prodID {
            case "Posa.LifeCount.iap.removeads":
                println("remove ads")
                removeAds?
            default:
                println("IAP not setup")
            }
            
        }
    }
    
    // 5
    func paymentQueue(queue: SKPaymentQueue!, updatedTransactions transactions: [AnyObject]!) {
        println("add paymnet")
        
        for transaction:AnyObject in transactions {
            var trans = transaction as SKPaymentTransaction
            println(trans.error)
            
            switch trans.transactionState {
                
            case .Purchased:
                println("buy, ok unlock iap here")
                println(p.productIdentifier)
                
                let prodID = p.productIdentifier as String
                switch prodID {
                case "Posa.LifeCount.iap.removeads":
                    println("remove ads")
                    removeAds?
                default:
                    println("IAP not setup")
                }
                
                queue.finishTransaction(trans)
                break;
            case .Failed:
                println("buy error")
                queue.finishTransaction(trans)
                break;
            default:
                println("default")
                break;
                
            }
        }
    }
    
    // 6
    func finishTransaction(trans:SKPaymentTransaction)
    {
        println("finish trans")
    }
    
    //7
    func paymentQueue(queue: SKPaymentQueue!, removedTransactions transactions: [AnyObject]!)
    {
        println("remove trans");
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
