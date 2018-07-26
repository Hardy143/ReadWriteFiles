//
//  ViewController.swift
//  ReadWriteFiles
//
//  Created by Vicki Larkin on 26/07/2018.
//  Copyright © 2018 Vicki Hardy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fileView: UITextView!
    
    let file = "file.txt"
    let text = "This is a text file that I'm\n testing out to see how\n it is"
    var fileUrl: URL?
    
    func createDirectory() {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            fileUrl = dir.appendingPathComponent(file)
            // write to file
            do {
                try text.write(to: fileUrl!, atomically: false, encoding: .utf8)
                print("file written")
            } catch {
                print(error)
            }
        }
    }
    
    func readFile() -> String? {
        
        var text2 = ""
        do {
            text2 = try String(contentsOf: fileUrl!, encoding: .utf8)
        } catch {
            print(error)
        }
        return text2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createDirectory()
        fileView.text = readFile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

