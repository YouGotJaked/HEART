using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Runtime.InteropServices;

public class BehaviourScript : MonoBehaviour {
	public GameObject ball;
	public Button button;
	
	// Create reference to C function
	[DllImport ("__Internal")]
	private static extern void calledFromUnity();
	
	// Listen for click event on button
	void Start() {
		button.onClick.AddListener(Tap);
	}

	// Invoke C function on click
	void Tap() {
		calledFromUnity();
	}

	// Make the ball bounce
	void Bounce(string direction) {
		ball.GetComponent<Rigidbody>().AddForce(transform.up * 300);
	}
}

