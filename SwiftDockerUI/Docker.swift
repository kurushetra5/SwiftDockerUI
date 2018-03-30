//
//  Docker.swift
//  SwiftDockerUI
//
//  Created by luis on 28/3/18.
//  Copyright © 2018 Talayot. All rights reserved.
//

import Foundation

enum DockerToolName:Int {
    case docker,dockerMachine,dockerCompose
}


protocol PlistReader {
   mutating func dataFromPlist()
}


protocol ShellComandRuner {
    var comandToRun:String {get set}
    var args:[String] {get set}
    func run()
}




protocol DockerTool:PlistReader,ShellComandRuner {
    var options2:String {get set}
    var options:[Option] {get set}
    var managmentComands:[ManagmentOption] {get set}
    var comands:[Comand]  {get set}
    var dockerComandName:DockerToolName {get set}
    
}


extension ShellComandRuner where Self:DockerTool {
    
    func run() {
        
    }
}




extension PlistReader where Self: DockerTool {
    
    mutating func dataFromPlist() {
        switch dockerComandName {
        case .docker:
            print("docker")
            let fileDict =  NSDictionary(contentsOfFile:"/Users/luis/Documents/Developer_Proyects/SwiftDockerUI/SwiftDockerUI/manDocker.plist")
//             print(fileDict?.object(forKey:"Commands") ?? "na")
            
            
            let dict:Dictionary<String,String> = fileDict?.object(forKey:"Commands") as! Dictionary<String, String>
            
            for comand in dict {
                let aComand  = Option(comand:comand.key, info:comand.value)
                options.append(aComand)
            }
            
            
//            options2 = ""
//            print(dict)
            
//            var dict:Dictionary<String,String> = fileDict as! Dictionary<String, String>
//            print(dict["Commands"])
            
//             comands = dict
        case .dockerMachine:
            print("dockerMachine")
        case .dockerCompose:
            print("dockerCompose")
        }
    }
    
    
    
    
}


protocol ToolComand {
    var comand:String {get set}
    var info:String {get set}
}



struct Option:ToolComand {
    var comand: String
    var info: String
    
}


struct ManagmentOption:ToolComand  {
    var comand: String
    var info: String
    
}

struct Comand :ToolComand {
    var comand: String
    var info: String
}






struct DockerComand: DockerTool {
    
 
    
    
    var options2:String = ""
    
    // ShellComandRuner delegates
    var comandToRun: String = ""
    var args: [String] = []
    
    // DockerTool delegates
    var dockerComandName: DockerToolName = .docker
    var options:[Option] = []
    var managmentComands:[ManagmentOption] = []
    var comands:[Comand] = []
    
}



struct DockerMachineComand : DockerTool  {
    
    
    var comandToRun: String = ""
    var args: [String] = []
    var options2:String = ""
    
    var dockerComandName: DockerToolName = .dockerMachine
    var options:[Option] = []
    var managmentComands:[ManagmentOption] = []
    var comands:[Comand] = []
    
}

struct DockerComposeComand : DockerTool  {
    
    
    var options2:String = ""
    var comandToRun: String = ""
    var args: [String] = []
    
    var dockerComandName: DockerToolName = .dockerCompose
    var options:[Option] = []
    var managmentComands:[ManagmentOption] = []
    var comands:[Comand] = []
    
    
    
    
}
