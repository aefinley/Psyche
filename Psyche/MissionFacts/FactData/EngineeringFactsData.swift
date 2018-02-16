//
//  EngineeringFactsData.swift
//  Psyche
//
//  Created by Allison Finley on 2/13/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

class EngineeringFactsData {
    
    var efacts:[efact] = []
    
    init() {
        let f1 = efact(factn: "Propulsion", factd: """
        Solar electric propulsion uses electricity from solar arrays to create
        electromagnetic fields to accelerate and expel charged atoms (ions) of xenon
        to create a very low thrust with a very efficient use of propellant (1)

        This will be the first use of Hall effect thrusters beyond lunar orbit.

        The Psyche spacecraft is using xenon:
            Xenon is a gas that is in the air we breathe (in very small amounts-- 0.09 parts per million! (2))
            Xenon gas is used in high quality light bulbs, including automobile headlamps and movie projectors.
            “The most common propellant used in ion propulsion is xenon, which is easily ionized and has a high atomic mass, thus generating a desirable level of thrust when ions are accelerated. It also is inert and has a high storage density; therefore, it is well suited for storing on spacecraft.” (3)

        (1) How Will NASA’s Asteroid Redirect Mission Help Humans Reach Mars?
        (1) https://www.nasa.gov/content/how-will-nasas-asteroid-redirect-mission-help-humans-reach-mars
        (2) Introduction to the Atmosphere
        (2) http://www.srh.noaa.gov/jetstream/atmos/atmos_intro.html
        (3) NASA -Ion Propulsion
        (3) https://www.nasa.gov/centers/glenn/about/fs21grc.html
        """, factin: #imageLiteral(resourceName: "Building"))
        
        let f2 = efact(factn: "Radio Science", factd: """
        The Psyche mission will use the X-band radio telecommunications system to measure Psyche’s gravity field to high precision.

        When combined with topography derived from onboard imagery, this will provide information on the interior structure of Psyche.

        The team is based at MIT and JPL.
        """, factin: #imageLiteral(resourceName: "Building"))
        
        let f3 = efact(factn: "Deep Space Optical Communication (DSOC)", factd: """
        The Psyche mission will test a sophisticated new laser communication technology that encodes data in photons (rather than radio waves) to communicate between a probe in deep space and Earth.

        Using light instead of radio allows the spacecraft to communicate more data in a given amount of time.

        The DSOC team is based at the Jet Propulsion Laboratory
        """, factin: #imageLiteral(resourceName: "Building"))
        
        let f4 = efact(factn: "Multispectral Imager", factd: """
        Provides high-resolution images using filters to discriminate between Psyche’s metallic and silicate constituents.

        Consists of a pair of identical cameras designed to acquire geologic, compositional, and topographic data.

        Purpose of the second camera is to provide redundancy for mission-critical optical navigation.

        The team is based at Arizona State University.
        """, factin: #imageLiteral(resourceName: "Building"))
        
        let f5 = efact(factn: "Gamma Ray and Neutron Spectrometer", factd: """
        Mounted on a 2-meter (6-foot) boom (“arm”) to:
            distance the sensors from background radiation created by energetic particles interacting with the spacecraft;
            provide an unobstructed field of view.

        The team is based at the Applied Physics Laboratory at Johns Hopkins University.
        """, factin: #imageLiteral(resourceName: "Building"))
        
        let f6 = efact(factn: "Bus Size", factd: """
        The bus (body) of the spacecraft is 3.1 meters (~10 feet) long by 2.4 meters
        (almost 8 feet) wide. A few size comparisons:
            It is slightly bigger than a Smart Car.
            It about the size of a garden storage shed.
            It is as tall as a regulation basketball hoop!
        """, factin: #imageLiteral(resourceName: "Building"))
        
        let f7 = efact(factn: "Spacecraft Size", factd: """
        The full spacecraft, including the solar panels, is 24.76 meters (~81 feet) long by 7.34 meters (~24 feet) wide. That is about the size of a (singles) tennis court.
        """, factin: #imageLiteral(resourceName: "Building"))
        
        efacts.append(f1)
        efacts.append(f2)
        efacts.append(f3)
        efacts.append(f4)
        efacts.append(f5)
        efacts.append(f6)
        efacts.append(f7)
        
        
    }
}

class efact {
    
    let factName:String?
    var factDescription:String?
    var factImage:UIImage?
    
    init(factn:String, factd:String, factin:UIImage)
    {
        factName = factn
        factDescription = factd
        factImage = factin
    }

//    func getName() -> String{
//        return factName!
//    }
//    
//    func getDesc() -> String{
//        return factDescription!
//    }
//    
//    func getImageName() ->String{
//        return factImageName!
//    }
    
}
