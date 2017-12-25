//
//  ARViewController.swift
//  Psyche
//
//  Created by Petra on 12/25/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {
    
  
    @IBOutlet weak var sceneView: ARSCNView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        sceneView.showsStatistics = true
        
        let scene = SCNScene(named: "model.scn")
        
        //set the scene to the view
        
        sceneView.scene = scene!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //create a session configuration
        
        let configuration = ARWorldTrackingConfiguration()
        
        //run the view's session
        
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //pause the view's session
        
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func sessionWasInterrupted(_ session: ARSession, didFailWithError error: Error) {
        
        
    }
    func sessionWasInterrupted(_ session: ARSession) {
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        
    }
    
    
    
    
}
