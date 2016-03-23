//
//  AddCarViewController.swift
//  CarKeeper1.0
//
//  Created by Justin Nguyen on 3/22/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class AddCarViewController: UIViewController,UIImagePickerControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var CarYearTextField: UITextField!
    @IBOutlet weak var CarMakeTextField: UITextField!
    @IBOutlet weak var CarModelTextField: UITextField!
    @IBOutlet weak var CarMileageTextField: UITextField!
    @IBOutlet weak var DefaultImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CarYearTextField.delegate = self
        CarMakeTextField.delegate = self
        CarModelTextField.delegate = self
        CarMileageTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
*/
    func PhotoPickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion:nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        //set the default image to the selected photo
        DefaultImageView.image = selectedPhoto
        //dismiss picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    //Actions
    
    @IBAction func selectImageFromLibrary(sender: UITapGestureRecognizer) {
        //Hides Keyboard when photoSelector Tapped
        CarYearTextField.resignFirstResponder()
        CarMakeTextField.resignFirstResponder()
        CarModelTextField.resignFirstResponder()
        CarMileageTextField.resignFirstResponder()
        
        // lets user pick photo
        let PPickerController = UIImagePickerController()
        // lets user pick photo only from library and not take a picture
        PPickerController.sourceType = .PhotoLibrary
        //lets view controller know image was picked
        PPickerController.delegate = self
        
        presentViewController(PPickerController, animated: true, completion: nil)
        
    }
    
    

}
