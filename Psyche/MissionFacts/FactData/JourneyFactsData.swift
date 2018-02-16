//
//  JourneyFactsData.swift
//  Psyche
//
//  Created by Allison Finley on 2/12/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

class JourneyFactsData {
    
    var jfacts: [jfact] = []
    
    init()
    {
        let f1 = jfact(factn: "The Team", factd: """
            Principal Investigator (PI): Lindy Elkins-Tanton, Arizona State University (ASU)
            
            The PI is responsible for overall mission success, and for the scientific integrity and execution of the mission within committed cost and schedule.
            The PI oversees the team organization, decides science priorities and progress, and oversees delivery of mission data to NASA’s Planetary Data System.
            The PI is the decision-maker within the Psyche team, and NASA is the ultimate decision-maker.
            The PI is responsible for ensuring that all mission participants are playing their roles as defined by the Team Guidelines.
            
            Deputy Principal Investigator (Deputy PI): Jim Bell, ASU
            
            Co-Investigators:
            Erik Asphaug, University of Arizona
            David Bercovici, Yale University
            Bruce Bills, Jet Propulsion Laboratory (JPL)
            Richard Binzel, Massachusetts Institute of Technology (MIT)
            William Bottke, Southwest Research Institute (SwRI)
            Ralf Jaumann, Deutsches Zentrum für Luft- und Raumfahrt
            Insoo Jun, JPL
            David Lawrence, Johns Hopkins University, Applied Physics Laboratory (APL)
            Simone Marchi, SwRI
            Timothy McCoy, Smithsonian Institution
            Ryan Park, JPL
            Patrick Peplowski, APL
            Thomas Prettyman, Planetary Science Institute
            Carol Raymond, JPL
            Chris Russell, University of California, Los Angeles
            Benjamin Weiss, MIT
            Dan Wenkert, JPL
            Mark Wieczorek, Observatoire de la Côte d’Azur
            David Williams, ASU
            Maria Zuber, MIT
            
            Psyche Science Partners:
            Applied Physics Laboratory (APL)
            Deutsches Zentrum für Luft- und Raumfahrt (DLR)
            General Dynamics
            Glenn Research Center (GRC)
            Jet Propulsion Laboratory (JPL)
            Massachusetts Institute of Technology (MIT)
            Malin Space Science Systems (MSSS)
            Observatoire de la Côte d’Azur
            Planetary Science Institute (PSI)
            Smithsonian Institution
            Southwest Research Institute (SwRI)
            SSL
            T esat Spacecom
            University of Arizona
            University of California Los Angeles (UCLA)
            Yale University
            
            The mission is led by Arizona State University. NASA’s Jet Propulsion Laboratory is responsible for mission management, operations and navigation. The spacecraft’s solar-electric propulsion chassis will be built by SSL with a payload that includes an imager, magnetometer, and a gamma-ray spectrometer.
            """
            , factin: #imageLiteral(resourceName: "Journey"))
        
        let f2 = jfact(factn: "Why", factd: """
            The asteroid Psyche may be able to tell us how Earth’s core and the cores of the other terrestrial (rocky) planets came to be. (The terrestrial planets are Mercury, Venus, Earth, and Mars.)
            
            We can never go to the Earth’s core:
                Earth’s core lies at 3,000 kilometers (more than 1,800 miles) depth but we have only drilled to 12 kilometers (~7.5 miles) – that’s the most our technology allows today.
            Earth’s core lies at about 3 million times the pressure of the atmosphere
            The temperature of Earth’s core is about 5,000 Celsius (~9,000 Fahrenheit)

            Because we cannot see or measure Earth’s core directly, asteroid Psyche offers a unique window into the violent history of collisions and accretion that created the terrestrial planets.

            It is the only known place in our solar system where we can examine directly what is almost certainly a metallic core of an early planet.
            """
            , factin: #imageLiteral(resourceName: "Journey"))
        
        let f3 = jfact(factn: "Goals", factd: """
            Understand a previously unexplored building block of planet formation: iron cores.  
            Look inside terrestrial planets, including Earth, by directly examining the interior of a differentiated body, which otherwise could not be seen.

            Explore a new type of world. For the first time, examine a world made not of rock and ice, but metal.
            """
            , factin: #imageLiteral(resourceName: "Journey"))
        
        let f4 = jfact(factn: "Cost", factd: """
            ~ $850 million (includes mission development, operations, and science)
            Amount does not include cost for the launch service which is procured separately
            Amount does not include the cost for the Deep Space Optical Communications demonstration hardware or operations

            """
            , factin: #imageLiteral(resourceName: "Journey"))
        
        let f5 = jfact(factn: "Objectives", factd: """
            Determine whether Psyche is a core, or if it is unmelted material.

            Determine the relative ages of regions of Psyche’s surface

            Determine whether small metal bodies incorporate the same light elements as are expected in the Earth’s high-pressure core.

            Determine whether Psyche was formed under conditions more oxidizing or more reducing than Earth’s core.

            Characterize Psyche’s morphology.
            """
        , factin: #imageLiteral(resourceName: "Journey"))
        
        jfacts.append(f1)
        jfacts.append(f2)
        jfacts.append(f3)
        jfacts.append(f4)
        jfacts.append(f5)
    }
    
}

class jfact {
    
    var factName:String?
    var factDescription:String?
    var factImage:UIImage?
    
    init(factn:String, factd:String, factin:UIImage)
    {
        factName = factn
        factDescription = factd
        factImage = factin
        
    }
    
}
