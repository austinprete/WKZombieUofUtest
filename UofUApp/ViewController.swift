//
//  ViewController.swift
//  UofUApp
//
//  Created by Austin Prete on 4/29/16.
//  Copyright © 2016 Austin Prete. All rights reserved.
//

import UIKit
import WKZombie
import hpple


class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    let url = NSURL(string: "https://go.utah.edu/cas/login")!
    
    lazy var browser : WKZombie = {
        return WKZombie(name: "U of U Student Portal")
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        browser.open(url)
            >>> browser.get(by: .XPathQuery("//*[@id=\"brand-left\"]/a/img"))
            >>> handleResult
            >>> browser.fetch
            === handleImage
        // Do any additional setup afte r loading the view, typically from a nib.
    }
    
    func handleResult<T: HTMLElement>(result: T) -> Action<HTMLImage> {
//        result.fetch
//        var original_image = (result as! HTMLImage)
//        let original_source = original_image.source
        (result as! HTMLImage).setValue(NSURL(string: "dog"), forKey: "src")
//        var new_result = HTMLImage(element: result)
//        new_result!.setValue(NSURL(string: "dog"), forKey: "src")
//        print(new_result!.source)
        return Action(value: result as! HTMLImage)
    }

    func handleImage(result: HTMLImage?) {
        print("dog")
//        imageView.image = .fetchedContent()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

