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

class AboutViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    // Process to send an email
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
            self.presentViewController(tweetSheet, animated: true, completion: nil)
        } else {
            print("error")
        }
    }
    
    func sendFacebookStatusMessage() {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let tweetSheet = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            tweetSheet.setInitialText("Look at this nice picture!")
            self.presentViewController(tweetSheet, animated: true, completion: nil)
        } else {
            print("error")
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
            print("should not be here")
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        print("should handle the result")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
