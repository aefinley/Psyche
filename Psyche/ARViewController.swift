//
//  ViewController.swift
//  coffeemug
//
//  Created by Petra Novakovic on 12/17/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {
    
    var sentValue = 0
    var myImage: UIImage!
  
    
    @IBOutlet weak var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationController?.setNavigationBarHidden(true, animated: true)
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
        // Create a new scene
        
    
    
    if (sentValue == 0){ //user selected to view asteroid
    
        let scene = SCNScene(named: "art.scnassets/asteroid.dae")!
        
        let cameraNode = SCNNode()
        
        cameraNode.camera = SCNCamera()
        
        scene.rootNode.addChildNode(cameraNode)
        
        //place the camera
        
        cameraNode.position = SCNVector3(x:0, y:0, z:15)
        
        self.sceneView.scene = scene
    }
    else if (sentValue == 1){ //user selected to view satellite
    
        let scene = SCNScene(named: "art.scnassets/satellite.scn")!
        
        //create and add camera to scene
        
        let cameraNode = SCNNode()
        
        cameraNode.camera = SCNCamera()
        
        scene.rootNode.addChildNode(cameraNode)
        
        //place the camera
        
        cameraNode.position = SCNVector3(x:0, y:0, z:15)
     
        
        self.sceneView.scene = scene
       
    }
       
    }
    @IBAction func unwindToARViewController(segue:UIStoryboardSegue) { }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
        sceneView.allowsCameraControl = true
        
        
    }
    
    

    @IBAction func takePhoto(_ sender: Any) {
    
    
        
        myImage = sceneView.snapshot();
     
      
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "SharePhoto") as! SharePhotoViewController
      

        vc.sentimage = myImage
        
       self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func goToHelpMenu(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ARMenuController") as! ARMenuController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

