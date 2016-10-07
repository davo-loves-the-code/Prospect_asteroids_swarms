using UnityEngine;
using System.Collections;

public class Rolling_keyinput : MonoBehaviour {


	// Use this for initialization
	void Start () {
		//printf ("Initialising advanced simulation...\n"); Doesn't work?
	}

	float rotation_speed = 10000;

	// Update is called once per frame
	void Update () {
		float rotationh = Input.GetAxis ("Horizontal") * rotation_speed;
		float rotationv = Input.GetAxis ("Vertical") * rotation_speed;
		rotationh = rotationh * Time.deltaTime ;
		rotationv = rotationv * Time.deltaTime ;
		//rigidbody.AddRelativeTorque(Vector3.back * rotation);
		GetComponent<Rigidbody>().AddRelativeTorque(Vector3.forward * rotationh, ForceMode.Impulse);
		GetComponent<Rigidbody>().AddRelativeTorque(Vector3.right * rotationv, ForceMode.Impulse);

		//
		//ForceMode.Impulse: Applies momentum change instantaneously. Simulate instantaneous reaction wheel firing.
	}
}
