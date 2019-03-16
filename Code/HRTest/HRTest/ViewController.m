//
//  ViewController.m
//  HRTest
//
//  Created by Jake Day on 2/26/19.
//  Copyright © 2019 Jake Day. All rights reserved.
//

#import <ResearchKit/ResearchKit.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Create a step
    ORKInstructionStep *myStep = [[ORKInstructionStep alloc] initWithIdentifier:@"intro"];
    myStep.title = @"Welcome to ResearchKit";
    
    // Create a task
    ORKOrderedTask *task = [[ORKOrderedTask alloc] initWithIdentifier:@"task" steps:@[myStep]];
    
    // Present the task
    ORKTaskViewController *taskViewController = [[ORKTaskViewController alloc] initWithTask:task taskRunUUID:nil];
    taskViewController.delegate = self;
    [self presentViewController:taskViewController animated:YES completion:nil];
}

- (void)taskViewController:(ORKTaskViewController *)taskViewController didFinishWithReason:(ORKTaskViewControllerFinishReason)reason error:(nullable NSError *)error {
    ORKTaskResult *taskResult = [taskViewController result];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
