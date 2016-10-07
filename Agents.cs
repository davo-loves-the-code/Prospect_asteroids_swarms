//using System;
using UnityEngine;

namespace AssemblyCSharp
{
	public class Agents
	{
		// DATA
	
		GameObject agent_object;
		
		float fitness;
		float[,] next_velocity;
		//map perhaps?

		// FUNCTIONS

		// Constructors
		public Agents ()
		{

			fitness = 0;
			next_velocity = new float[0, 0];
		}
		public Agents (GameObject  gptr)
		{
			agent_object = gptr;
			fitness = 0;
			next_velocity = new float[0, 0];
		}

		float eval_fitness() {
			return fitness;
		}

		//    ----------------------------------------- API calls 
		//Get position												//
		public float get_position_x() {
			return agent_object.transform.position.x;				//
		}
		public float get_position_y() {								//
			return agent_object.transform.position.y;
		}															//

		// Get orientation											//
		public float get_rotation_x() {
			return agent_object.transform.rotation.x;				//
		}
		public float get_rotation_y() {								//
			return agent_object.transform.rotation.y;
		}															//
		public float get_rotation_z() {
			return agent_object.transform.rotation.z;				//
		}

		// Apply angular impulse around an axis
		public int angular_impulse_x(float magnitude) {
			agent_object.GetComponent<Rigidbody>().AddRelativeTorque(Vector3.right * magnitude, ForceMode.Impulse);
			return 1;
		}
		public int angular_impulse_y(float magnitude) {
			agent_object.GetComponent<Rigidbody>().AddRelativeTorque(Vector3.up * magnitude, ForceMode.Impulse);
			return 1;
		}
		public int angular_impulse_z(float magnitude) {
			agent_object.GetComponent<Rigidbody>().AddRelativeTorque(Vector3.forward * magnitude, ForceMode.Impulse);
			return 1;
		}



	}
}

