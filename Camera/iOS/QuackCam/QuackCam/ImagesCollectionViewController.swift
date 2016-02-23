//
//  ImagesCollectionViewController.swift
//  QuackCam
//
//  Created by Neil Taylor on 17/02/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit
import AVFoundation

class ImagesCollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    /** 
     * This array contains the ImageData, which specify the image id and a title. 
     */
    var imageDetails = [ImageData]()
    
    let QCImageKey = "ImageDataKey"
    
    let QCImageDetailsFile = "imageDetails"
    
    let QCCellReuseIdentifier = "takePicture"
    
    let QCCellImageReuseIdentifier = "image"
    
    let QCImageSuffix = ".jpg"
    
    let QCImageThumbnailSuffix = "_thumbnail.jpg"
    
    /** 
     * The display is ready and the UI controls have been 
     * created. The extra setup is to see if we can load 
     * the imageDetails array from disk.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        outputDocumentsListToConsole()
        print(documentPathWithString(QCImageDetailsFile))
        
        // If there is already a file of image details, load it
        // so we know what images we have accessed before.
        if NSFileManager.defaultManager().fileExistsAtPath(documentPathWithString(QCImageDetailsFile)) {
           imageDetails = (NSKeyedUnarchiver.unarchiveObjectWithFile(documentPathWithString(QCImageDetailsFile)) as? [ImageData])!
        }
    }
    
    /**
     * This method will be called when the main view is about to 
     * disappear from the screen. In the method, we save the 
     * image array. We could do this at other times, but here is 
     * one possibility.
     */
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // serialise the array of ImageData objects to disk.
        if NSKeyedArchiver.archiveRootObject(imageDetails, toFile: documentPathWithString(QCImageDetailsFile)) {
            print("Succeeded")
        }
        else {
            print("Failed")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /** 
     * This method is only used to illustrate the files are being placed into the 
     * Documents directory. It doesn't serve any other purpose in the application.
     * Notice, this function handles an exception if there is an error.
     */
    func outputDocumentsListToConsole() {
        do {
            let directoryList = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(documentsDirectoryURL(), includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions())
            print(directoryList)
        }
        catch let error as NSError {
            print("uh-oh! \(error.localizedDescription)")
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UICollectionViewDataSource
    
    /**
     * Return how many sections are to be displayed.
     */
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /** 
     * Should return the number of cells in the given section. This method will return the 
     * number of items in the imageDetails array, with an extra 1. The extra item is so that 
     * there is a button as the first item that will allow us to add new photos.
     */
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageDetails.count + 1
    }
    
    /** 
     * This method is called to determine what should be displayed. This is equivalent to the cellForRowAtIndexPath 
     * in the UITableViewController. We are responsible for accessing the data and setting up the cell that 
     * is to be displayed.
     */
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell
        
        if indexPath.row == 0 {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier(QCCellReuseIdentifier, forIndexPath: indexPath)
            return cell
        } else {
            let imageCell = collectionView.dequeueReusableCellWithReuseIdentifier(QCCellImageReuseIdentifier, forIndexPath: indexPath) as? ImageCollectionViewCell
        
            let name = imageDetails[indexPath.row - 1].name
            let imageFileURL = documentsDirectoryURLWithFileComponent( name + QCImageThumbnailSuffix)
            imageCell?.imageView?.image = UIImage(data: NSData(contentsOfURL: imageFileURL)!)

            return imageCell!
        }
    }
    
    // MARK: - UICollectionViewDelegate
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    // MARK: - Take Photo
    
    /** 
     * This function displays a UIAlertController, which is a  dialog 
     * box in the middle of the screen. This has two buttons. If the 
     * Settings button is pressed, the user is taken to the Settings 
     * application where the access to the camera can be changed.
     * 
     * Note: if the user does change the status of the camera access in 
     * the settings App, this App will be restarted by the operating 
     * system. This appears to be a design choice by Apple, to ensure 
     * that the App takes account of the updated privacy settings.
     */
    func encourageUserToEnableCameraAccessInSettings() {
     
        let alert = UIAlertController(title: "Camera Access",
            message: "In order to take a picture, we will need access to the camera. Please enable this in the settings.",
            preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .Default, handler: { (UIAlertAction) in
            dispatch_async(dispatch_get_main_queue(), {
                    UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
                })
        })
        
        alert.addAction(defaultAction)
        alert.addAction(settingsAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    /** 
     *
     */
    func formattedDateForCurrentTime() -> (String, NSDate) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd-HH-mm-ss"
        let date = NSDate()
        return (dateFormatter.stringFromDate(date), date)
    }
    
    /**
     * Method from the UIImagePickerController, which confirms when an image has been selected. 
     * This method will take the image and store it to the file. It will also create thumbnail 
     * image, which is what will be displayed in the UICollectionView. Once the data has been 
     * accessed, it will reload the data.
     */
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            let (dateString, date) = formattedDateForCurrentTime()
            
            let data = NSData(data: UIImagePNGRepresentation(image)!)
            data.writeToURL(documentsDirectoryURLWithFileComponent(dateString + QCImageSuffix), atomically: true)
            
            // create the thumbnail, too 
            // based on example code at http://nshipster.com/image-resizing/ 
            
            let size = CGSizeApplyAffineTransform(image.size, CGAffineTransformMakeScale(0.1, 0.1))
            UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
            image.drawInRect(CGRect(origin: CGPointZero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            let scaledData = NSData(data: UIImageJPEGRepresentation(scaledImage, 1.0)!)
            scaledData.writeToURL(documentsDirectoryURLWithFileComponent(dateString + "_thumbnail.jpg"), atomically: true)
            
            imageDetails.append(ImageData(name: dateString, title: "Title: \(dateString)", date: date))
            
            collectionView?.reloadData()
        }
        
        // we are responsible for requesting the picker to be removed from the screen.
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /** 
     * Callback method that is called when the user clicked the Cancel 
     * button in the UIImagePicker display. The only action we take 
     * in response to that is to dismiss the UIImagePicker from the 
     * display.
     */
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /** 
     * Action that responds to the button to add an image.
     */
    @IBAction func addImage(sender: AnyObject) {
        
        // check the privacy settings. This could be tidied up...
        switch AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo) {
            
        case .NotDetermined:
            AVCaptureDevice.requestAccessForMediaType(AVMediaTypeVideo, completionHandler: {
                granted in
                if granted {
                    print("User granted the request")
                }
                else {
                    print("User denied request")
                }
            })
            break
            
        case .Denied, .Restricted:
            encourageUserToEnableCameraAccessInSettings()
            return
            
        default:
            print("The user has previously allowed access to the camera")
        }
        
        // display the camera if it is available, otherwise try to present the
        // list of images from the Photo Library.
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .Camera
            picker.cameraDevice = .Front
            picker.modalPresentationStyle = .CurrentContext
            presentViewController(picker, animated: true, completion: nil)
        }
        else if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            print("Photo library is available")
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .PhotoLibrary
            picker.modalPresentationStyle = .CurrentContext
            presentViewController(picker, animated: true, completion: nil)
        }
        else {
           print("Camera unavailable") // should be improved with some UI...
        }
        
    }
    
    /**
     * Passes the information for the currently selected image to the destination 
     * view controller.
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? ImageDisplayViewController {
            
            let paths = self.collectionView?.indexPathsForSelectedItems()
            if let row = paths?[0].row {
               controller.pictureData = imageDetails[row - 1]            }
            
        }
    }
    
}
