//
//  AsteroidFactsData.swift
//  Psyche
//
//  Created by Allison Finley on 2/12/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

class AsteroidFactsData {
    
    var afacts:[afact] = []
    
    init()
    {
        let f1 = afact(factn: "Gravity", factd: """
            The surface gravity on Psyche is much less than Earth, and even less than the Moon. On Psyche, lifting a car would feel as light as lifting a dog or a 2nd grader!
            """, factin: #imageLiteral(resourceName: "Asteroid"))
    
        let f2 = afact(factn: "Appearance", factd: """
            Scientists have combined radar and optical observations to generate a 3D shape model of Psyche.(12) This model:
            Shows evidence for two crater-like depressions.
            Suggests that there is significant variation in the metal content and color of the asteroid over the surface.
            NOTE: No one has seen the Psyche asteroid yet, so we will not know what it actually looks like until the spacecraft arrives.

            (12)Radar Observations and Share Model of Asteroid 16 Psyche
            (12) http://outreach.naic.edu/ao/blog/radar-observations-and-shape-model-asteroid-16-psyche
            """, factin: #imageLiteral(resourceName: "Asteroid"))
    
        let f3 = afact(factn: "Discovery", factd: """
            Discovered in 1852

            Discovered by Italian astronomer Annibale de Gasparis.

            6th asteroid to be discovered.

            Named for the goddess of the soul in ancient Greek mythology.
            """, factin: #imageLiteral(resourceName: "Asteroid"))
    
        let f4 = afact(factn: "Density", factd: """
            Psyche is dense--perhaps as dense as 7,000 kilograms per cubic meter (kg/m3) (similar to the density of a bar of steel).(10)


            (10) Elkins-Tanton, L. T., Asphaug, E., Bell, J. F., Bercovici, D., Bills, B. G., Binzel, R. P., ... & Jun, I. (2017, March). Asteroid (16) Psyche: Visiting a Metal World. In Lunar and Planetary Science Conference (Vol. 48).
            """, factin: #imageLiteral(resourceName: "Asteroid"))
    
        let f5 = afact(factn: "Composition", factd: """
            Psyche is likely made almost entirely of nickel-iron metal.

            Its bulk appears to be metal but its surface appears to have small areas that are rocky.
            How do we know? Confirmed by measurements of:
                Radar albedo (Radar albedo is the “ratio of a target’s radar cross section in a specified polarization to its projected area; hence, a measure of the target’s radar reflectivity”(4),(5))
                Thermal inertia (Thermal inertia “refers to the ability of a material to conduct and store heat, and in planetary science, its measure of the subsurface's ability to store heat during the day and reradiate it during the night.”(6))

            (4) http://echo.jpl.nasa.gov/asteroids/ostro_1998_encyc_ss.pdf
            (5) “Radar” is an acronym for ‘radio detection and ranging.’ Radar was developed to detect objects and determine their range (or position) by transmitting short bursts of microwaves. The strength and origin of "echoes" received from objects that were hit by the microwaves is then recorded.
            (6) What on Mars is a High Thermal-Inertia Surface?
            (6) https://www.jpl.nasa.gov/spaceimages/details.php?id=PIA19357
            """, factin: #imageLiteral(resourceName: "Asteroid"))
    
        let f6 = afact(factn: "Beliefs", factd: """
            Scientists believe Psyche is the exposed nickel-iron core of an early planet, one of the building blocks of our solar system.

            Psyche is most likely a survivor of multiple violent hit-and-run collisions, common when the solar system was forming.
            """, factin: #imageLiteral(resourceName: "Asteroid"))
    
        let f7 = afact(factn: "Size", factd: """
            As asteroids go, Psyche is relatively large and has an irregular shape:
            279 x 232 x 189 kilometers (173 x 144 x 117 miles).(11)
            If Psyche were a perfect sphere, it would have a diameter of 226 kilometers (140 miles):
            That is about the length of the state of Massachusetts (leaving out Cape Cod); If it were in Arizona it would stretch between Phoenix and Flagstaff!
            A surface area of about 641,800 square kilometers (246,300 square miles), making it just smaller than the area of the state of Texas and quite a bit larger than the area of California.

            (11) Shepard, M. K., Richardson, J., Taylor, P. A., Rodriguez-Ford, L. A., Conrad, A., de Pater, I., ... & Close, L. M. (2017). Radar observations and shape model of asteroid 16 Psyche. Icarus, 281, 388-403.
            """, factin: #imageLiteral(resourceName: "Asteroid"))
    
        let f8 = afact(factn: "Where", factd: """
            Psyche lies in the main asteroid belt between Mars and Jupiter.

            Psyche orbits the Sun at an average distance of 3 astronomical units (AU) (about 280 million miles); Earth orbits at 1 AU (about 93 million miles).
                Fun fact: Because Psyche and Earth orbit at different speeds, the distance from Earth to Psyche varies over a large range! From < 2 AU to > 4 AU.
            """, factin: #imageLiteral(resourceName: "Asteroid"))
        let f9 = afact(factn: "Team on Psyche", factd: """
                A day on Psyche is about 4 hours and 12 minutes.(7)
            This is the sidereal rotation period, or the "amount of time it takes for a [body] to completely spin around and make one full rotation." (8)
            You could live through just under six “days” on Psyche in the same time as one day on Earth!

            A year on Psyche lasts about five Earth years (about 1,828 Earth days).(9)

            https://ssd.jpl.nasa.gov/sbdb.cgi?sstr=16

            (7) Shepard, M. K., Richardson, J., Taylor, P. A., Rodriguez-Ford, L. A., Conrad, A., de Pater, I., ... & Close, L. M. (2017). Radar observations and shape model of asteroid 16 Psyche. Icarus, 281, 388-403: "sidereal rotation period P = 4.195948 h"
            (8) How long is one day on other planets?
            (8) https://spaceplace.nasa.gov/days/en/
            (9) JPL Small-Body Database Browser (Solar System Dynamics)
            (9) https://ssd.jpl.nasa.gov/sbdb.cgi?sstr=16
            """, factin: #imageLiteral(resourceName: "Asteroid"))
    
        afacts.append(f1)
        afacts.append(f2)
        afacts.append(f3)
        afacts.append(f4)
        afacts.append(f5)
        afacts.append(f6)
        afacts.append(f7)
        afacts.append(f8)
        afacts.append(f9)
    }
}


class afact {
    
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
