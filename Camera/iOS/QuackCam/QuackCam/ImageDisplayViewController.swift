//
//  ImageDisplayViewController.swift
//  QuackCam
//
//  Created by Neil Taylor on 17/02/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit

class ImageDisplayViewController: UIViewController, UINavigationControllerDelegate {
    
    
    var pictureData: ImageData? {
        didSet {
            self.configureView()
        }
    }
    
    func configureView() {
        if let data = self.pictureData, label = self.imageName {
            label.text = data.title
            let imageFileURL = documentsDirectoryURLWithFileComponent( data.name + ".jpg")
            image.image = UIImage(data: NSData(contentsOfURL: imageFileURL)!)
        }
    }

    @IBOutlet weak var imageName: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = self
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.delegate = nil
        
        if self.isMovingFromParentViewController() {
            print("Moving from parent: \(self.parentViewController)")
        }
    }
    
    deinit {
        print("Deinit called")
        self.image.image = nil
        self.imageName.text = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeImageName(sender: AnyObject) {
        let alert = UIAlertController(title: "Enter Name", message: "Name for the picture", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: { (UIAlertAction) in
           self.imageName.text = alert.textFields?[0].text!
           self.pictureData!.title = self.imageName.text!
        })
        
        let settingsAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addAction(defaultAction)
        alert.addAction(settingsAction)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
           textField.text! = self.imageName.text!
        }
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        print("storyboard segue is in progress.")
    }

}
