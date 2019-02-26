// .mm

#import "AppController.h"

@implementation AppController {
	UIButton *btn;
}

// Method invoked once Unity controller is started
- (void) startUnity:(UIApplication *)application {
	[super startUnity:application];

	// Listen for UnityNotification, call notificationFired
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationFired:) name:@"UnityNotification" object:nil];

	// Create new UIViewController, place original Unity view controller on it
	UIViewController *vc = [UIViewController new];
	[vc.view setFrame:self.window.bounds];
	[vc.view addSubview:self.rootViewController.view];
	[vc addChildViewController:self.rootViewController];
	[vc addChildViewController:self.rotViewController];
	[self.window setRootViewController:vc];

	// Create button, place it on UIViewController
	btn = [UIButton buttonWithType:UIButtonTypeSystem];
	[btn setTitle:@"To Unity" forState:UIControlStateNormal];
	[btn setBackGroundColor:[UIColor whiteColor]];
	[btn setTintColor:[UIColor orangeColor]];
	[btn setFrame:CGRectMake(10, 10, 100, 50)];
	[btn addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
	[vc.view addSubview:btn];
}


/*
 * Fire UnitySendMessage with 3 parameters:
 *	"Plane":	name of GameObject in Unity
 *	"Bounce":	name of function in BehaviourScript.cs
 *	"Up":		parameter to be ued in Bounce(string) function
 */
- (void) tapButton:(UIButton *)sender {
	UnitySendMessage("Plane", "Bounce", "Up");
}

// Change title of button, reset after 1 second
- (void) notificationFired:(NSNotificarion *)notification {
	NSString *originalTitle = [btn titleForState: UIControlStateNormal];
	[btn setTitle:@"😎" forState:UIControlStateNormal];
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[btn setTitle:originalTitle forState:UIControlStateNormal];
	});
}
@end
