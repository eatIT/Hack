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
    @IBOutlet weak var student_login_button: UIButton!
    @IBOutlet weak var parent_login_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        
        parent_login_button.layer.borderWidth = 1
        parent_login_button.layer.borderColor = UIColor.blackColor().CGColor
        student_login_button.layer.borderWidth = 1
        student_login_button.layer.borderColor = UIColor.blackColor().CGColor


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func parent_login(sender: AnyObject) {
    }
    
    @IBAction func student_login(sender: AnyObject) {
    }
    
    @IBAction func sign_up(sender: AnyObject) {
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
