//
//  PresentationViewController.swift
//  PBDemo
//
//  Created by Manpreet Singh on 02/09/18.
//  Copyright © 2018 Manpreet Singh. All rights reserved.
//


import UIKit

import PayBright


class PresentationViewController: UIViewController, PBWebViewDelegate {
    
    
    @IBOutlet var amountTF: UITextField?
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        setup()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Void
    
    func setup() {
        
        
    }
    
    
    // MARK: - IBAction
    
    @IBAction func devModeTap() {
        
        let vc = ViewController()
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func launchPayBrightTap() {
        
        if (amountTF?.text?.isEmpty)!
        {
            let alert = UIAlertController(title: "Empty", message: "Pleasy specify the amount", preferredStyle: .alert)
            
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            
            self.present(alert, animated: true, completion: nil)
        }
        
        else
        {
            let customerObj = PBCustomer.init(customerEmail:        "cs@paybright.com",
                                              customerFirstName:    "James",
                                              customerLastName:     "Testhetfield",
                                              customerPhone:        nil)
            
            
            let customerBillingObj = PBCustomerBilling.init(customerBillingAddress1:    "270 Rue Olier",
                                                            customerBillingAddress2:    nil,
                                                            customerBillingCity:        "Chicoutimi",
                                                            customerBillingCompany:     nil,
                                                            customerBillingCountry:     "CA",
                                                            customerBillingPhone:       "+1-613-987-6543",
                                                            customerBillingState:       "QC",
                                                            customerBillingZip:         "G7G 4J3")
            
            
            let customerShippingObj = PBCustomerShipping.init(customerShippingAddress1:     "270 Rue Olier",
                                                              customerShippingAddress2:     nil,
                                                              customerShippingCity:         "Chicoutimi",
                                                              customerShippingCompany:      "Shopify",
                                                              customerShippingCountry:      "CA",
                                                              customerShippingFirstName:    "James",
                                                              customerShippingLastName:     "Testhetfield",
                                                              customerShippingPhone:        "+1-613-987-6543",
                                                              customerShippingState:        "QC",
                                                              customerShippingZip:          "G7G 4J3")
            
            
            let productObj = PBProduct.init(amount:         (NumberFormatter().number(from: (amountTF?.text)!)?.doubleValue)!,
                                            currency:       "CAD",
                                            description:    "PaymentGatewayTesting - #4682855809085",
                                            invoice:        "#4682855809085",
                                            planID:         nil,
                                            platform:       "sdk",
                                            reference:      "4682855809085",
                                            shopCountry:    "CA",
                                            shopName:       "PaymentGatewayTesting",
                                            urlCallback:    "https://checkout.shopify.com/services/ping/notify_integration/paybright/19629019",
                                            urlCancel:      "https://paymentgatewaytesting.myshopify.com/19629019/checkouts/84044f7a52ff18a84dd1f2b5cd46b387?key=0c4978718a87a00e5ac1456b577b5695",
                                            urlComplete:    "https://paymentgatewaytesting.myshopify.com/19629019/checkouts/84044f7a52ff18a84dd1f2b5cd46b387/offsite_gateway_callback")
            
            
            let instanceObj = PBInstance.init(customerObj:          customerObj,
                                              customerBillingObj:   customerBillingObj,
                                              customerShippingObj:  customerShippingObj,
                                              productObj:           productObj)
            
            
            PBConfig.shared.instanceObj = instanceObj
            
            
            let pbVC :PBViewController = PBViewController.init(nibName: "PBViewController", bundle: Bundle(for: PBViewController.self))
            
            pbVC.delegate = self
            
            self.navigationController?.pushViewController(pbVC, animated: true)
        }
    }
    
    
    // MARK: - PBWebViewDelegate
    
    func userDidCancel() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            let alert = UIAlertController(title: "Cancelled", message: "User cancelled the transaction", preferredStyle: .alert)
            
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func transactionComplete(success: Bool, params: [String : String]) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            if success
            {
                let alert = UIAlertController(title: params["x_message"], message: params.description, preferredStyle: .alert)
                
                
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                
                
                self.present(alert, animated: true, completion: nil)
            }
                
            else
            {
                let alert = UIAlertController(title: "Failed", message: "", preferredStyle: .alert)
                
                
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
}

