//
//  ViewController.swift
//  SwiftDockerUI
//
//  Created by luis on 28/3/18.
//  Copyright © 2018 Talayot. All rights reserved.
//


import Cocoa
import KUTaskFramework


class ViewController: NSViewController {

    var dockerTools:DockerTools = DockerTools()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(dockerTools.dockerComandsList())
        
//        dockerTools.runComand()
//        dockerTools.docker.run()
        
        ComandsRuner.comandsRunerId = ""
          ComandsRuner.run(comand:"fireWallState", forEver: false) { (result) in
            print(result)
          }
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

