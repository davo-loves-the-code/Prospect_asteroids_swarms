using UnityEngine;
using System;
using System.Collections;
using AssemblyCSharp;

public class Master_control : MonoBehaviour {

	float rotation_speed = 10000;
	int i;
	GameObject[] agent_objects;
	Agents[] agents = new Agents[5];



	// Use this for initialization
	void Start () {
		// Find all agents, ordered by name
		agent_objects = GameObject.FindGameObjectsWithTag ("Agent");
		//Array.Sort (agent_objects, compare_object_names);
		for (i = 0; i < 5; i++) {
			agents[i] = new Agents (agent_objects[i]);
		}
	}
	
	// Update is called once per frame
	void Update () {
		

		float rotationh = Input.GetAxis ("Horizontal") * rotation_speed;
		float rotationv = Input.GetAxis ("Vertical") * rotation_speed;
		rotationh = rotationh * Time.deltaTime ;
		rotationv = rotationv * Time.deltaTime ;

		for (i = 0; i < 5; i++) {
			agents[i].angular_impulse_x (rotationh);
			agents[i].angular_impulse_z (rotationv);
			//agents[i].GetComponent<Rigidbody>().AddRelativeTorque(Vector3.forward * rotationh, ForceMode.Impulse);
			//agents[i].GetComponent<Rigidbody>().AddRelativeTorque(Vector3.right * rotationv, ForceMode.Impulse);
		}

		//
		//ForceMode.Impulse: Applies momentum change instantaneously. Simulate instantaneous reaction wheel firing.
		
	}

	int compare_object_names(GameObject X, GameObject Y) {
		return X.name.CompareTo (Y.name);
	}
}
