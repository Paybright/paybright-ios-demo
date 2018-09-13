//
//  ViewController.swift
//  PBDemo
//
//  Created by Manpreet Singh on 15/08/18.
//  Copyright © 2018 Manpreet Singh. All rights reserved.
//


import UIKit

import PayBright


class ViewController: UIViewController, PBWebViewDelegate {
    
    
    @IBOutlet var collectionCustTF: [UITextField] = []
    
    @IBOutlet var collectionCustBillingTF: [UITextField] = []
    
    @IBOutlet var collectionCustShippingTF: [UITextField] = []
    
    @IBOutlet var collectionProductTF: [UITextField] = []
    
    @IBOutlet var collectionSC: [UISegmentedControl] = []
    
    
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
    
    @IBAction func crossTap() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func launchPayBrightTap() {
        
        let customerObj = PBCustomer.init(customerEmail:        collectionCustTF[0].text!,
                                          customerFirstName:    collectionCustTF[1].text!,
                                          customerLastName:     collectionCustTF[2].text!,
                                          customerPhone:        (collectionCustTF[3].text?.isEmpty)! ? nil : collectionCustTF[3].text)
        
        
        let customerBillingObj = PBCustomerBilling.init(customerBillingAddress1:    collectionCustBillingTF[0].text!,
                                                        customerBillingAddress2:    (collectionCustBillingTF[1].text?.isEmpty)! ? nil : collectionCustBillingTF[1].text,
                                                        customerBillingCity:        collectionCustBillingTF[2].text!,
                                                        customerBillingCompany:     (collectionCustBillingTF[3].text?.isEmpty)! ? nil : collectionCustBillingTF[3].text,
                                                        customerBillingCountry:     collectionCustBillingTF[4].text!,
                                                        customerBillingPhone:       collectionCustBillingTF[5].text!,
                                                        customerBillingState:       collectionCustBillingTF[6].text!,
                                                        customerBillingZip:         collectionCustBillingTF[7].text!)
        
        
        let customerShippingObj = PBCustomerShipping.init(customerShippingAddress1:     collectionCustShippingTF[0].text!,
                                                          customerShippingAddress2:     (collectionCustShippingTF[1].text?.isEmpty)! ? nil : collectionCustShippingTF[1].text,
                                                          customerShippingCity:         collectionCustShippingTF[2].text!,
                                                          customerShippingCompany:      collectionCustShippingTF[3].text!,
                                                          customerShippingCountry:      collectionCustShippingTF[4].text!,
                                                          customerShippingFirstName:    collectionCustShippingTF[5].text!,
                                                          customerShippingLastName:     collectionCustShippingTF[6].text!,
                                                          customerShippingPhone:        collectionCustShippingTF[7].text!,
                                                          customerShippingState:        collectionCustShippingTF[8].text!,
                                                          customerShippingZip:          collectionCustShippingTF[9].text!)
        
        
        let productObj = PBProduct.init(amount:         (NumberFormatter().number(from: collectionProductTF[0].text!)?.doubleValue)!,
                                        currency:       collectionProductTF[1].text!,
                                        description:    collectionProductTF[2].text!,
                                        invoice:        collectionProductTF[3].text!,
                                        planID:         (collectionProductTF[4].text?.isEmpty)! ? nil : collectionProductTF[4].text,
                                        platform:       collectionProductTF[5].text!,
                                        reference:      collectionProductTF[6].text!,
                                        shopCountry:    collectionProductTF[7].text!,
                                        shopName:       collectionProductTF[8].text!,
                                        urlCallback:    collectionProductTF[9].text!,
                                        urlCancel:      collectionProductTF[10].text!,
                                        urlComplete:    collectionProductTF[11].text!)
        
        
        let instanceObj = PBInstance.init(customerObj:          customerObj,
                                          customerBillingObj:   customerBillingObj,
                                          customerShippingObj:  customerShippingObj,
                                          productObj:           productObj)
        
        
        PBConfig.shared.accountID       = collectionProductTF[12].text!
        
        PBConfig.shared.apiToken        = collectionProductTF[13].text!
        
        PBConfig.shared.instanceObj     = instanceObj
        
        
        let pbVC :PBViewController = PBViewController.init(nibName: "PBViewController", bundle: Bundle(for: PBViewController.self))
        
        pbVC.delegate = self
        
        self.navigationController?.pushViewController(pbVC, animated: true)
    }
    
    
    @IBAction func segChanged(sender: UISegmentedControl) {
        
        if sender == collectionSC[0]
        {
            if sender.selectedSegmentIndex == 0         // Auto Capture
            {
                collectionProductTF[12].text = "NjOcXFC8cvTPtAwv3TCGFvSamx74HPvTgm1s46CcGENMmbWFUa"
                
                collectionProductTF[13].text = "9O49jqV5mW5wWvctuk3mjs9WW5A4VgW5wrtRSvaYSHfahaYOBX"
            }
                
            else if sender.selectedSegmentIndex == 1    // Authorization
            {
                collectionProductTF[12].text = "aGGGm7d7tYTnMvrZQHfDJNFsRqq63FJYR2tkqk7bSU3Ad1MjbQ"
                
                collectionProductTF[13].text = "nvaEg7tHCdOcJ7XK8Hdsm7MJY3SWZtksZtrv4FFhCRG3cduddj"
            }
        }
        
        else if sender == collectionSC[1]
        {
            if sender.selectedSegmentIndex == 0         // Completed
            {
                collectionCustTF[1].text = "James"
                
                collectionCustTF[2].text = "Testhetfield"
                
                
                collectionCustBillingTF[0].text = "270 Rue Olier"
                
                collectionCustBillingTF[2].text = "Chicoutimi"
                
                collectionCustBillingTF[6].text = "QC"
                
                collectionCustBillingTF[7].text = "G7G 4J3"
                
                
                collectionCustShippingTF[0].text = "270 Rue Olier"
                
                collectionCustShippingTF[2].text = "Chicoutimi"
                
                collectionCustShippingTF[5].text = "James"
                
                collectionCustShippingTF[6].text = "Testhetfield"
                
                collectionCustShippingTF[8].text = "QC"
                
                collectionCustShippingTF[9].text = "G7G 4J3"
            }
            
            else if sender.selectedSegmentIndex == 1    //Failed
            {
                collectionCustTF[1].text = "Billy"
                
                collectionCustTF[2].text = "Bucket"
                
                
                collectionCustBillingTF[0].text = "1531 Lee Blvd"
                
                collectionCustBillingTF[2].text = "Winnipeg"
                
                collectionCustBillingTF[6].text = "MB"
                
                collectionCustBillingTF[7].text = "R3Y 1S3"
                
                
                collectionCustShippingTF[0].text = "1531 Lee Blvd"
                
                collectionCustShippingTF[2].text = "Winnipeg"
                
                collectionCustShippingTF[5].text = "Billy"
                
                collectionCustShippingTF[6].text = "Bucket"
                
                collectionCustShippingTF[8].text = "MB"
                
                collectionCustShippingTF[9].text = "R3Y 1S3"
            }
        }
        
        else if sender == collectionSC[2]
        {
            if sender.selectedSegmentIndex == 0
            {
                PBConfig.shared.environment = .Sandbox
            }
            
            else
            {
                PBConfig.shared.environment = .Production
            }
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

