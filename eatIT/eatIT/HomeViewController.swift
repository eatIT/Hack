//
//  HomeViewController.swift
//  eatIT
//
//  Created by Jasmine Lu on 20/02/2016.
//  Copyright © 2016 jasminelu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var sign_up_button: UIButton!
    @IBOutlet weak var login_button: UIButton!
    
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        
        login_button.layer.borderWidth = 1
        login_button.layer.borderColor = UIColor.blackColor().CGColor
        sign_up_button.layer.borderWidth = 1
        sign_up_button.layer.borderColor = UIColor.blackColor().CGColor
        
        logo.image = UIImage(named: "logo.png")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sign_up(sender: AnyObject) {
        
        let vc = SignUpViewController(nibName: nil, bundle: nil)
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func login(sender: AnyObject) {
        let vc = LoginViewController(nibName: nil, bundle: nil)
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
