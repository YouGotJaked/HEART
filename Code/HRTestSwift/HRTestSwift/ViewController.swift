//
//  ViewController.swift
//  HRTestSwift
//
//  Created by Jake Day on 3/16/19.
//  Copyright © 2019 Jake Day. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Create a step
        let myStep = ORKHrCaptureStep(identifier: "hr")
        myStep.title = "Heart Rate Test"
        // Create a task
        let task = ORKOrderedTask(identifier: "task", steps: [myStep])
        // Present the task
        let taskViewController = ORKTaskViewController(task: task, taskRun: nil)
        taskViewController.delegate = self as? ORKTaskViewControllerDelegate
        present(taskViewController, animated: true, completion: nil)
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        let taskResult = taskViewController.result
        // do something with result
        
        // dismiss task view controller
        dismiss(animated: true, completion: nil)
    }


}

