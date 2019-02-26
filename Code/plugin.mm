extern "C" {
	void calledFromUnity() {
		[[NSNotificationCenter defaultCenter] postNotificationName:@"UnityNotification" object:nil];
	}
}

