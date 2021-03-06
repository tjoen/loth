/* Copyright (c) 2012-2013 EL-EMENT saharan
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this
 * software and associated documentation  * files (the "Software"), to deal in the Software
 * without restriction, including without limitation the rights to use, copy,  * modify, merge,
 * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to
 * whom the Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies or
 * substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 * PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
 * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
package com.elementdev.oimo.physics.demo {
	import com.elementdev.oimo.physics.collision.shape.BoxShape;
	import com.elementdev.oimo.physics.collision.shape.ShapeConfig;
	import com.elementdev.oimo.physics.collision.shape.SphereShape;
	import com.elementdev.oimo.physics.constraint.joint.DistanceJoint;
	import com.elementdev.oimo.physics.constraint.joint.JointConfig;
	import com.elementdev.oimo.physics.dynamics.RigidBody;
	/**
	 * ...
	 * @author saharan
	 */
	public class DistanceJointDemo extends DemoBase {
		
		public function DistanceJointDemo() {
			title = "Distance joint";
		}
		
		override public function reset():void {
			var sc:ShapeConfig = new ShapeConfig();
			var jc:JointConfig = new JointConfig(); // ジョイントの共通設定
			var body:RigidBody;
			
			body = new RigidBody(0, 3, 0);
			body.addShape(new SphereShape(sc, 0.3));
			body.setupMass(RigidBody.BODY_STATIC);
			world.addRigidBody(body);
			
			jc.body1 = body; // 1番目の剛体を設定
			jc.localAnchorPoint1.init(0, 0, 0); // 剛体の重心にジョイントを取り付ける
			
			body = new RigidBody(1, 5, 0.5);
			body.addShape(new BoxShape(sc, 1, 1, 1));
			body.setupMass();
			world.addRigidBody(body);
			
			jc.body2 = body; // 2番目の剛体を設定
			jc.localAnchorPoint2.init(-0.5, 0, 0); // 剛体の側面にジョイントを取り付ける
			
			world.addJoint(new DistanceJoint(jc, 1.5, 2)); // 1.5～2mの範囲を動けるようにする
			
			sc.friction = 2;
			sc.density = 10;
			control = new RigidBody(0, 0.75, 6);
			control.addShape(new SphereShape(sc, 0.75));
			control.setupMass();
			world.addRigidBody(control);
		}
		
	}

}