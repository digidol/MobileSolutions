//
//  AboutViewController.swift
//  TabBar-part1-Swift
//
//  Created by Neil Taylor on 11/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit
import Social
import MessageUI

class AboutViewController: UITableViewController, MFMailComposeViewControllerDelegate,
    UIAlertViewDelegate {

    // Process to send an email. There is a problem in the 
    // simulators for Xcode 6.1 and Xcode 6.2. The mail sheet will 
    // appear, but it won't accept changes and it will clear itself 
    // from the screen after a few seconds. It should work correctly 
    // on a device. Here's hoping it is fixed in Xcode 6.3.
    func sendEmail() {
        
        if MFMailComposeViewController.canSendMail() {
            let mailer = MFMailComposeViewController()
            
            mailer.mailComposeDelegate = self
            mailer.setSubject("This is an example subject")
            mailer.setToRecipients(["nst@aber.ac.uk"])
            mailer.setMessageBody("Hello, Email", isHTML: false)
            self.presentViewController(mailer, animated: true, completion: nil)
        }
    }
    
    func sendTweet() {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let tweetSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            tweetSheet.setInitialText("This is an example tweet.")
            
            // we can use a closure (headless function) 
            // to find out what the user selected to do.
            // The closure is using a shorthand argument, $0, rather than 
            // using the longer closure definition.
            tweetSheet.completionHandler = {
                switch $0 {
                case .Cancelled:
                    println("cancelled")
                case .Done:
                    println("done")
                }
            }
            
            // Using a closure to handle a notification when the sheet has been 
            // displayed. We could also just pass in nil if we don't care.
            self.presentViewController(tweetSheet, animated: true, completion: {
               println("this tweet was presented.")
            })
        } else {
            println("error")
            
            // Create a popup message, with a title, message and button. 
            // The UIAlertView can tell you which button was pressed. To find out, 
            // set up the delegate (e.g. to self, as in this example), 
            // add the protocol UIAlertViewDelegate to your class definition and 
            // add a method such as alertView:didDismissButtonWithIndex: which 
            // you can see below. 
            UIAlertView(title: "Unable to show the tweet", message: "Have you entered a password in the settings?", delegate: self, cancelButtonTitle: "OK").show()
        }
    }
    
    // This is one of the possible methods that you could respond to in the 
    // UIAlertViewDelegate protocol.
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        println("Clicked the button with index \(buttonIndex)")
    }
    
    func sendFacebookStatusMessage() {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let facebookSheet = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText("Look at this nice picture!")
            self.presentViewController(facebookSheet, animated: true, completion: nil)
        } else {
            println("error")
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            sendEmail()
        case 1:
            sendTweet()
        case 2:
            sendFacebookStatusMessage()
        default:
            println("should not be here")
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        println("should handle the result")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
