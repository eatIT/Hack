//
//  SignUpViewController.swift
//  eatIT
//
//  Created by Jasmine Lu on 20/02/2016.
//  Copyright © 2016 jasminelu. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirm_password: UITextField!
    @IBOutlet weak var user_type_picker: UIPickerView!
    @IBOutlet weak var sign_up_button: UIButton!
    
    @IBOutlet weak var success_message: UILabel!
    
    let user_type_array = ["parent", "student"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        
        username.backgroundColor = UIColor.clearColor()
        password.backgroundColor = UIColor.clearColor()
        confirm_password.backgroundColor = UIColor.clearColor()
        
        sign_up_button.layer.borderWidth = 1
        sign_up_button.layer.borderColor = UIColor.blackColor().CGColor
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return user_type_array.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return user_type_array[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sign_up(sender: AnyObject) {
        
        if (username.text == "" || password.text == "" || confirm_password.text == "") {
            
            success_message.text = "Fill in all empty fields"
            
            return
            
        }
        
        if (password.text != confirm_password.text) {
            
            success_message.text = "Passwords do not match!"
            
            return
            
        }
        
        if (password.text == confirm_password.text) {
            
            let user = PFUser()
            user.username = username.text
            user.email = username.text
            user.password = password.text
            user["user_type"] = user_type_array[user_type_picker.selectedRowInComponent(0)]
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool, error: NSError?) -> Void in
                if (error == nil) {
                    self.success_message.text = "Sign Up Successful!"
                } else {
                    self.success_message.text = "Sign Up Unsuccessful!"
                }
            }
            
        }
        
    }

    @IBAction func back(sender: AnyObject) {
        
        let vc = HomeViewController(nibName: nil, bundle: nil)
        self.presentViewController(vc, animated: true, completion: nil)
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
