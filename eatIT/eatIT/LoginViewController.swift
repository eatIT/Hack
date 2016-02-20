//
//  LoginViewController.swift
//  eatIT
//
//  Created by Jasmine Lu on 20/02/2016.
//  Copyright © 2016 jasminelu. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var back_button: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login_button: UIButton!
    @IBOutlet weak var message: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)

        login_button.layer.borderWidth = 1
        login_button.layer.borderColor = UIColor.blackColor().CGColor
        username.backgroundColor = UIColor.clearColor()
        password.backgroundColor = UIColor.clearColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(username.text!, password:password.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                let query : PFQuery = PFUser.query()!
                query.whereKey("username", equalTo:self.username.text!)
                query.findObjectsInBackgroundWithBlock {
                    (objects: [PFObject]?, error: NSError?) -> Void in
                    if error == nil {
                        if let objects = objects {
                            for object in objects {
                                let user_type = object.objectForKey("user_type") as! String;
                                if (user_type == "parent") {
                                    let vc = ParentViewController(nibName: nil, bundle: nil)
                                    self.presentViewController(vc, animated: true, completion: nil)
                                }
                                else if (user_type == "student") {
                                    let vc = StudentViewController(nibName: nil, bundle: nil)
                                    self.presentViewController(vc, animated: true, completion: nil)
                                }
                                else if (user_type == "establishment") {
                                    let vc = EstablishmentViewController(nibName: nil, bundle: nil)
                                    self.presentViewController(vc, animated: true, completion: nil)
                                }
                            }
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }
                
            } else {
                self.message.text = "Login Unsuccessful"
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
