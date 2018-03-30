//
//  DockerComandTools.swift
//  SwiftDockerUI
//
//  Created by luis on 28/3/18.
//  Copyright © 2018 Talayot. All rights reserved.
//

import Foundation




class DockerTools {
    
    var docker:DockerComand = DockerComand()
    var dockerCompose:DockerComposeComand = DockerComposeComand()
    var dockerMachine:DockerMachineComand = DockerMachineComand()
    
    
    init( ) {
        docker.dataFromPlist()
        dockerCompose.dataFromPlist()
        dockerMachine.dataFromPlist()
    }
    
    
    func dockerComandsList() -> [Option] {
        return docker.options
    }
    func dockerComposeComandsList() -> [Option] {
        return dockerCompose.options
    }
    func dockerMachineComandsList() -> [Option] {
        return dockerCompose.options
    }
    
    
    func runComand()  {
        
    }
    
    
    func setComandToDocker(comand:String, args:[String]) {
        docker.comandToRun = comand
        docker.args = args
    }
    func setComandToDockerCompose(comand:String, args:[String]) {
        dockerCompose.comandToRun = comand
        dockerCompose.args = args
    }
    func setComandToMachine(comand:String, args:[String]) {
        dockerMachine.comandToRun = comand
        dockerMachine.args = args
    }
    
    
}

