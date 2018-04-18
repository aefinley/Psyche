//
//  ViewController.swift
//  Psyche
//
//  Created by Petra Novakovic on 10/19/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    

    
    @IBOutlet weak var twitterFeed: UIView!
    @IBOutlet weak var menu: UIImageView!

    
    @IBOutlet weak var menuWidth: NSLayoutConstraint!
    
    
    @IBOutlet weak var nasaButton: UIButton!
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    
    @IBOutlet weak var yearTitle: UILabel!
    @IBOutlet weak var dayTitle: UILabel!
    @IBOutlet weak var hourTitle: UILabel!
    @IBOutlet weak var minuteTitle: UILabel!
    
    var menuShowing = false //boolean to see if menu is showing currently or not
    var countdownTimer:Timer!
    var nextEvent:TimeInterval = 681004800 // time from Jan. 1 2001 to Aug. 1 2022
    var countdownLabels:[UILabel] = []
    var xBounds:[CGFloat] = []
    var countdownTitles:[UILabel] = []

    var viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let insertContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let titles = [
        "Propulsion",                                                       //0
        "Radio Science",                                                    //1
        "Deep Space Optical Communication (DSOC)",                          //2
        "Multispectral Imager",                                             //3
        "Gamma Ray and Neutron Spectrometer",                               //4
        "Bus Size",                                                         //5
        "Spacecraft Size",                                                  //6
        "Preliminary Design of all Instruments and Spacecraft",             //7
        "Critical Design and Build of all Instruments and Spacecraft",      //8
        "Instrument And Spacecraft Build and Assembly",                     //9
        "Spacecraft Ships to Launch Site",                                  //10
        "Gravity",                                                          //11
        "Appearance",                                                       //12
        "Discovery",                                                        //13
        "Density",                                                          //14
        "Composition",                                                      //15
        "Beliefs",                                                          //16
        "Size",                                                             //17
        "Where",                                                            //18
        "Time on Psyche",                                                   //19
        "The Team",                                                         //20
        "Why",                                                              //21
        "Goals",                                                            //22
        "Cost",                                                             //23
        "Objectives",                                                       //24
        "Concept Study",                                                    //25
        "Launch",                                                           //26
        "Mars Gravity Assist",                                              //27
        "Arrival At Psyche",                                                //28
        "Orbiting Psyche",                                                  //29
        "Mission Closeout"                                                  //30
    ]
    
    var dates = [
        "Jan 2017 - May 2019", //7 - 2 orange
        "May 2019 - Jan 2021", //8 - 4 darkerOrange
        "Jan 2021 - July 2022", //9 - 5 pink
        "May 2022", //10 - 6 pink
        "Sept 2015 - Dec 2016", //25 - 1 orange
        "Aug 2022", //26 - J 7 darkPurple
        "May 2023", //27 - J 8 darkPurple
        "Jan 2026", //28 - J 9 dark Purple
        "Jan 2026 - Oct 2027", //29 - J 10 darkPurple
        "Nov 2017", //30 - J 3 darkerOrange
    ]
    
    var timelineEventOrder = [1, 3, 4, 5, 0, 6, 7, 8, 9, 2]
    
    var timelineImages = [#imageLiteral(resourceName: "orangeDot"), #imageLiteral(resourceName: "darkerOrgangeDot"), #imageLiteral(resourceName: "pinkDot"), #imageLiteral(resourceName: "pinkDot"), #imageLiteral(resourceName: "orangeDot"), #imageLiteral(resourceName: "darkPurpleDot"), #imageLiteral(resourceName: "darkPurpleDot"), #imageLiteral(resourceName: "darkPurpleDot"), #imageLiteral(resourceName: "darkPurpleDot"), #imageLiteral(resourceName: "darkerOrgangeDot")] //this should be the correct order
    
    //    var dates = [
    //        "Sept 2015 - Dec 2016", //25 - J 1
    //        "Jan 2017 - May 2019", //7 - E 2
    //        "Nov 2017", //30 - J 3
    //        "May 2019 - Jan 2021", //8 - E 4
    //        "Jan 2021 - July 2022", //9 - E 5
    //        "May 2022", //10 - E 6
    //        "Aug 2022", //26 - J 7
    //        "May 2023", //27 - J 8
    //        "Jan 2026", //28 - J 9
    //        "Jan 2026 - Oct 2027", //29 - J 10
    //    ]
    
    //7 Engineering, 7 Asteroird, 17 Journey
    var images = [UIImage]()
    var enginImg = [#imageLiteral(resourceName: "PsycheTrajectoryImage"), #imageLiteral(resourceName: "seven"), #imageLiteral(resourceName: "Journey"), #imageLiteral(resourceName: "five"), #imageLiteral(resourceName: "seven"), #imageLiteral(resourceName: "JourneyButton"), #imageLiteral(resourceName: "Journey"), #imageLiteral(resourceName: "seven"), #imageLiteral(resourceName: "seven"), #imageLiteral(resourceName: "seven"), #imageLiteral(resourceName: "seven")]//11 7-10 time
    var asteroidImg = [#imageLiteral(resourceName: "closeupSquare"), #imageLiteral(resourceName: "six"), #imageLiteral(resourceName: "closeupSquare1"), #imageLiteral(resourceName: "closeupSquare2"), #imageLiteral(resourceName: "six"), #imageLiteral(resourceName: "closeupLong"), #imageLiteral(resourceName: "Journey"), #imageLiteral(resourceName: "PsycheTrajectoryImage"), #imageLiteral(resourceName: "original1")] //9
    var journeyImg = [#imageLiteral(resourceName: "nine"), #imageLiteral(resourceName: "DNQwGA3UIAYyNSp"), #imageLiteral(resourceName: "six"), #imageLiteral(resourceName: "seven"), #imageLiteral(resourceName: "Journey"), #imageLiteral(resourceName: "closeupSquare1"), #imageLiteral(resourceName: "PsycheTrajectoryImage"), #imageLiteral(resourceName: "PsycheTrajectoryImage"), #imageLiteral(resourceName: "PsycheTrajectoryImage"), #imageLiteral(resourceName: "PsycheTrajectoryImage"), #imageLiteral(resourceName: "PsycheTrajectoryImage")] //11 25-30 time
    
    let descriptions = ["""
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
    """, //0
        
        """
    The Psyche mission will use the X-band radio telecommunications system to measure Psyche’s gravity field to high precision.
    
    When combined with topography derived from onboard imagery, this will provide information on the interior structure of Psyche.
    
    The team is based at MIT and JPL.
    """, //1
        
        """
    The Psyche mission will test a sophisticated new laser communication technology that encodes data in photons (rather than radio waves) to communicate between a probe in deep space and Earth.
    
    Using light instead of radio allows the spacecraft to communicate more data in a given amount of time.
    
    The DSOC team is based at the Jet Propulsion Laboratory
    """, //2
        
        """
    Provides high-resolution images using filters to discriminate between Psyche’s metallic and silicate constituents.
    
    Consists of a pair of identical cameras designed to acquire geologic, compositional, and topographic data.
    
    Purpose of the second camera is to provide redundancy for mission-critical optical navigation.
    
    The team is based at Arizona State University.
    """, //3
        
        """
    Mounted on a 2-meter (6-foot) boom (“arm”) to:
        distance the sensors from background radiation created by energetic particles interacting with the spacecraft;
            provide an unobstructed field of view.

    The team is based at the Applied Physics Laboratory at Johns Hopkins University.
    """, //4
        
        """
    The bus (body) of the spacecraft is 3.1 meters (~10 feet) long by 2.4 meters
        (almost 8 feet) wide. A few size comparisons:
    It is slightly bigger than a Smart Car.
    It about the size of a garden storage shed.
    It is as tall as a regulation basketball hoop!
    """, //5
        
        """
    The full spacecraft, including the solar panels, is 24.76 meters (~81 feet) long by 7.34 meters (~24 feet) wide. That is about the size of a (singles) tennis court.
    """, //6
        
        """
    Science and engineering teams on the mission are designing the spacecraft and the instruments that will be used to analyze the asteroid.

    March 2019, the team will undergo project and flight system Preliminary Design Review.

    May 2019, the team reaches Key Decision Point C, which will give the team the official approval to move to the next phase (Phase C).
    """, //7
        
        """
    Science and engineering teams begin to build their instruments.

    The instruments consist of a magnetometer, a multispectral imager, and a gamma ray and neutron spectrometer.

    The mission will use an X-band radio telecommunications system to measure Psyche’s gravity field to high precision. When combined with topography derived from onboard imagery, this will provide information on the interior structure of Psyche.

    The mission will also test a sophisticated new laser communication technology that encodes data in photons (rather than radio waves) to communicate between a probe in deep space and Earth. Using light instead of radio allows the spacecraft to communicate more data in a given amount of time.

    April 2020, the teams will undergo Project and Flight System Critical Design Review, this is an integral step in the instrument engineering process.

    The bus or “body” of the spacecraft will be completed by May 2020.

    In January 2021, the team will conduct the Systems Integration Review to ensure that the system is ready to be integrated. The last step in Phase C is Key Decision Point D that will give the team the official approval to move to the next phase.
    """, //8
        
        """
    During this phase, all the spacecraft subsystems are integrated onto the spacecraft bus.

    The spacecraft undergoes vibration testing.

    The spacecraft undergoes environmental thermal-vacuum testing.

    The spacecraft undergoes electromagnetic interference, electromagnetic compatibility testing.

    In May 2022 the team will conduct the Operations Readiness Review to ensure the system, procedures, and all supporting software and personnel are ready and fully operational. Before launch, the team will conduct Key Decision Point E that will determine readiness to conduct post launch operations.
    """, //9
        
        """
    The Psyche spacecraft, now fully assembled, includes solar panels, which fold during transport and launch.

    The spacecraft measures about 81 feet long (24.76 meters) when the solar panels are unfolded. This is about the size of a singles tennis court.

    The body of the spacecraft is about 10 feet long (3.1 meters) and almost eight feet (2.4 meters) wide.
    """, //10
        
        """
    The surface gravity on Psyche is much less than Earth, and even less than the Moon. On Psyche, lifting a car would feel as light as lifting a dog or a 2nd grader!
    """, //11
        
        """
    Scientists have combined radar and optical observations to generate a 3D shape model of Psyche.(12) This model:
    Shows evidence for two crater-like depressions.
    Suggests that there is significant variation in the metal content and color of the asteroid over the surface.
    NOTE: No one has seen the Psyche asteroid yet, so we will not know what it actually looks like until the spacecraft arrives.
        
    (12)Radar Observations and Share Model of Asteroid 16 Psyche
    (12) http://outreach.naic.edu/ao/blog/radar-observations-and-shape-model-asteroid-16-psyche
    """, //12
        
        """
    Discovered in 1852
        
    Discovered by Italian astronomer Annibale de Gasparis.
        
    6th asteroid to be discovered.
        
    Named for the goddess of the soul in ancient Greek mythology.
    """, //13
        
        """
    Psyche is dense--perhaps as dense as 7,000 kilograms per cubic meter (kg/m3) (similar to the density of a bar of steel).(10)
        
        
    (10) Elkins-Tanton, L. T., Asphaug, E., Bell, J. F., Bercovici, D., Bills, B. G., Binzel, R. P., ... & Jun, I. (2017, March). Asteroid (16) Psyche: Visiting a Metal World. In Lunar and Planetary Science Conference (Vol. 48).
    """, //14
        
        """
    Psyche is likely made almost entirely of nickel-iron metal.
        
    Its bulk appears to be metal but its surface appears to have small areas that are rocky.
    How do we know? Confirmed by measurements of:
    Radar albedo (Radar albedo is the “ratio of a target’s radar cross section in a specified polarization to its projected area; hence, a measure of the target’s radar reflectivity”(4),(5))
    Thermal inertia (Thermal inertia “refers to the ability of a material to conduct and store heat, and in planetary science, its measure of the subsurface's ability to store heat during the day and reradiate it during the night.”(6))
        
    (4) http://echo.jpl.nasa.gov/asteroids/ostro_1998_encyc_ss.pdf
    (5) “Radar” is an acronym for ‘radio detection and ranging.’ Radar was developed to detect objects and determine their range (or position) by transmitting short bursts of microwaves. The strength and origin of "echoes" received from objects that were hit by the microwaves is then recorded.
    (6) What on Mars is a High Thermal-Inertia Surface?
    (6) https://www.jpl.nasa.gov/spaceimages/details.php?id=PIA19357
    """, //15
        
        """
    Scientists believe Psyche is the exposed nickel-iron core of an early planet, one of the building blocks of our solar system.
        
    Psyche is most likely a survivor of multiple violent hit-and-run collisions, common when the solar system was forming.
    """, //16
        
        """
    As asteroids go, Psyche is relatively large and has an irregular shape:
        279 x 232 x 189 kilometers (173 x 144 x 117 miles).(11)
    If Psyche were a perfect sphere, it would have a diameter of 226 kilometers (140 miles):
    That is about the length of the state of Massachusetts (leaving out Cape Cod); If it were in Arizona it would stretch between Phoenix and Flagstaff!
    A surface area of about 641,800 square kilometers (246,300 square miles), making it just smaller than the area of the state of Texas and quite a bit larger than the area of California.
        
    (11) Shepard, M. K., Richardson, J., Taylor, P. A., Rodriguez-Ford, L. A., Conrad, A., de Pater, I., ... & Close, L. M. (2017). Radar observations and shape model of asteroid 16 Psyche. Icarus, 281, 388-403.
    """, //17
        
        """
    Psyche lies in the main asteroid belt between Mars and Jupiter.
        
    Psyche orbits the Sun at an average distance of 3 astronomical units (AU) (about 280 million miles); Earth orbits at 1 AU (about 93 million miles).
    Fun fact: Because Psyche and Earth orbit at different speeds, the distance from Earth to Psyche varies over a large range! From < 2 AU to > 4 AU.
    """, //18
        
        """
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
    """, //19
        
        """
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
    """, //20
        
        """
    The asteroid Psyche may be able to tell us how Earth’s core and the cores of the other terrestrial (rocky) planets came to be. (The terrestrial planets are Mercury, Venus, Earth, and Mars.)
    
    We can never go to the Earth’s core:
    Earth’s core lies at 3,000 kilometers (more than 1,800 miles) depth but we have only drilled to 12 kilometers (~7.5 miles) – that’s the most our technology allows today.
    Earth’s core lies at about 3 million times the pressure of the atmosphere
    The temperature of Earth’s core is about 5,000 Celsius (~9,000 Fahrenheit)
        
    Because we cannot see or measure Earth’s core directly, asteroid Psyche offers a unique window into the violent history of collisions and accretion that created the terrestrial planets.
        
    It is the only known place in our solar system where we can examine directly what is almost certainly a metallic core of an early planet.
    """, //21
        
        """
    Understand a previously unexplored building block of planet formation: iron cores.  
    Look inside terrestrial planets, including Earth, by directly examining the interior of a differentiated body, which otherwise could not be seen.
        
    Explore a new type of world. For the first time, examine a world made not of rock and ice, but metal.
    """, //22
        
        """
    ~ $850 million (includes mission development, operations, and science)
    Amount does not include cost for the launch service which is procured separately
    Amount does not include the cost for the Deep Space Optical Communications demonstration hardware or operations
        
    """, //23
        
        """
    Determine whether Psyche is a core, or if it is unmelted material.
        
    Determine the relative ages of regions of Psyche’s surface
        
    Determine whether small metal bodies incorporate the same light elements as are expected in the Earth’s high-pressure core.
        
    Determine whether Psyche was formed under conditions more oxidizing or more reducing than Earth’s core.
        
    Characterize Psyche’s morphology.
    """, //24
        
        """
    In September of 2015, the Psyche Mission (as it was proposed in Step 1) was selected by NASA to develop a     detailed concept study for consideration for NASA’s Discovery Program. (Step 1 is the initial proposal stage; the team had been working on the idea since 2011 and submitted a 256 page Step 1 proposal that was selected for the Phase A concept study.)
        
    A large team worked on the study, led by the Principal Investigator, Lindy Elkins-Tanton, and consisting of an expansive team that included scientists, engineers, project managers, schedulers, financial modelers, graphic designers, and marketing leads from ASU, JPL, SSL, as well as more than a dozen other universities and research organizations.
        
    In November of 2016, the team presented the proposed mission to 30 NASA reviewers during a nine-hour “site visit” which included a tour of SSL’s high bay, where the Psyche chassis will be built.
        
    The site visit is an intense, highly technical in-person review done by a select group of science, technical, and industry experts. They review every detail of the proposed mission, from concept and design, to execution and science application, as well as how the mission personnel from different institutions work together as a team.
    """, //25
        
        """
    At the launch site the team will conduct an entire re-check of the spacecraft before integrating into the launch vehicle.
        
    The spacecraft will launch August of 2022.
        
    Once in space, the spacecraft will travel using solar-electric propulsion.
        
    It will arrive at the asteroid, located in the main asteroid belt between Mars and Jupiter, in early January of 2026.
    """, //26
        
        """
    Phase E begins after the Post Launch Assessment Review is conducted.
        
    The spacecraft will use the gravity of Mars to increase speed and to set its trajectory to intersect with Psyche’s orbit around the Sun.
        
    It does this by entering and leaving the gravitational field of Mars.
        
    This slingshot maneuver will save propellant, time and expense.
    """, //27
        
        """
    Leading up to arrival at Psyche, the spacecraft will spend 100 days in the approach phase.
        
    The spacecraft will also measure the asteroid’s spin axis and rotation.
    """, //28
        
        """
    The spacecraft will orbit the asteroid for 21 months.
        
    It will perform science operations from four different orbits, each successively closer to the asteroid.
        
    In each orbit, the instruments on board will send data back to Earth to be analyzed by the mission’s science team.
    """, //29
        
        """
    In this final phase, the mission team will provide all remaining deliverables and safely decommission the space flight systems.
    """ //30
    ]
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    
        if(menuShowing){
           menuWidth.constant = -300
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function to open nasa.gov link when nasa.gov button is selected
    @IBAction func openNasa(_ sender: UIButton) {
        
        if let url = URL(string: "http://nasa.gov/psyche"){
            
        
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("open url: \(success)")
            }) //open url when link clicked
    }
        
        

    }
    
    @IBAction func openASU(_ sender: Any) {
        if let url = URL(string: "http://psyche.asu.edu"){
            
            
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("open url: \(success)")
            }) //open url when link clicked
        
    }
    }
    
    
    
    @IBAction func openMenuAction(_ sender: UIButton) {
        sender.shake()
        if(menuShowing){
            menuWidth.constant = -300
        }
        else{
            menuWidth.constant = -5
            
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
            view.layoutIfNeeded()
        }
        
        menuShowing = !menuShowing
    }
    
    @IBAction func closeMenu(_ sender: UIButton) {
        if(menuShowing){
            menuWidth.constant = -300
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
            view.layoutIfNeeded()
            menuShowing = false
        }
    }
    
    @IBAction func redirect(_ sender: UIBarButtonItem) {
        var url:URL
        switch sender.tag {
        case 0:
            url = URL(string: "https://www.facebook.com/NASAPsyche")!
        case 1:
            url = URL(string: "https://www.twitter.com/NASAPsyche")!
        case 2:
            url = URL(string: "https://www.instagram.com/nasapsyche")!
        default:
            url = URL(string: "https://www.google.com")!
        }
        UIApplication.shared.open(url, options: [:])
    }
    
    // must expose this function to objective c
    @objc func countdownChanged() {
        
        // one minute has passed, modify the count down time and update the UI
        
        let launch = Date(timeIntervalSinceReferenceDate: nextEvent)
        let currentTime = Date()
        let timeComponents = Calendar.current.dateComponents([.year, .day, .hour, .minute], from: currentTime, to: launch)
        let year:Int = timeComponents.year!
        let day:Int = timeComponents.day!
        let hour:Int = timeComponents.hour!
        let minute:Int = timeComponents.minute!
        
        yearLabel.text = (String)(format: "%02d", year)
        dayLabel.text = (String)(format: "%03d", day)
        hourLabel.text = (String)(format: "%02d", hour)
        minuteLabel.text = (String)(format: "%02d", minute)
        
        let fontSizeNumbers = 0.18666666666 * self.view.frame.width
        
        for i in 0..<countdownLabels.count {
            var boxWidth:CGFloat = 10 * fontSizeNumbers / 12
            
            if i == 1 {
                boxWidth *= 1.5333
            }
            
            let boxHeight:CGFloat = (6 * fontSizeNumbers / 7)
            let size = CGSize(width: boxWidth, height: boxHeight)
            
            countdownLabels[i].frame.size = size
            
            countdownTitles[i].center.x = countdownLabels[i].center.x
        }
        
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.pulsateMenu()
        
        //close menu if user clicks on main view
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.1843, green: 0.1255, blue: 0.2745, alpha: 1.0)  //this code was generated online, I had to find the exact RGB values for deep purple background color
        
        menuWidth.constant = -175 //menu should be hidden when view loads, width is 300 so needs to be -300
        
        menu.layer.shadowOpacity = 1
        menu.layer.shadowRadius = 5
        menu.image = #imageLiteral(resourceName: "menuImageFlipped")
        //self.menu.bringSubview(toFront: menu); //makes sure menu view does not get mixed with twitter feed
        
        self.menu.layer.zPosition = 1 //ensures that menu view is on top of the main view
        self.view.bringSubview(toFront: menu)
        
        // starts the count down timer, executes countdownChanged every second
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdownChanged), userInfo: nil, repeats: true)
        countdownChanged()
        
        // move the countdown labels to their correct positions
        countdownTitles = [yearTitle, dayTitle, hourTitle, minuteTitle]
        countdownLabels = [yearLabel, dayLabel, hourLabel, minuteLabel]
        
        // change the sizes/fonts of the the titles and the clock
        let fontSizeNumbers = 0.18666666666 * self.view.frame.width
        let startNum:CGFloat = -1.6
        let numChars:CGFloat = 7
        let space = abs(startNum / (numChars * 1.5))
        
        xBounds = [ startNum, 6*space + startNum, 15*space + startNum, 21*space + startNum]
        
        for i in 0..<countdownLabels.count {
            countdownLabels[i].font = UIFont(name: "Knockout", size: fontSizeNumbers)
            countdownLabels[i].frame.origin.y = 49 * self.view.frame.size.height / 200
            
            countdownLabels[i].frame.origin.x = (xBounds[i] + 2.3) * fontSizeNumbers
        }
        
        let fontSizeTitles = 0.02213541666 * self.view.frame.width
        
        for i in 0..<countdownTitles.count {
            let title = countdownTitles[i]
            title.frame.origin.y = countdownLabels[i].center.y - (countdownLabels[i].frame.height / 2) - 2 * fontSizeTitles
            title.font = UIFont(name: "Helvetica", size: fontSizeTitles)
            title.sizeToFit()
            title.center.x = countdownLabels[i].center.x
            
        }
        //dnaflk
        menuButton.addTarget(self, action: #selector(ViewController.openMenuAction(_:)), for: UIControlEvents.touchUpInside)
            
        //gesture created so if user clicks on outside view menu will close
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.closeMenu))
            
        self.view.addGestureRecognizer(gesture)
            
        self.navigationController?.setNavigationBarHidden(true, animated: true)
            
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
            
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.1843, green: 0.1255, blue: 0.2745, alpha: 1.0)  //this code was generated online, I had to find the exact RGB values for deep purple background color
            
            
        menuWidth.constant = -300 //menu should be hidden when view loads, width is 300 so needs to be -300
            
        menu.layer.shadowOpacity = 1
        menu.layer.shadowRadius = 5
        menu.image = #imageLiteral(resourceName: "menuImage")
        //self.menu.bringSubview(toFront: menu); //makes sure menu view does not get mixed with twitter feed
            
            
        self.menu.layer.zPosition = 1 //ensures that menu view is on top of the main view
        self.view.bringSubview(toFront: menu)
        
        getImages()
        
        asteroidImg.append(contentsOf: journeyImg)
        enginImg.append(contentsOf: asteroidImg)
        images.append(contentsOf: enginImg)
        
        // get a handler to the contact entity
        let entityDescription = NSEntityDescription.entity(forEntityName: "Fact", in: insertContext)
        
        // create a fetch request
        let request: NSFetchRequest<Fact> = Fact.fetchRequest()
        
        // associate the request with contact handler
        request.entity = entityDescription
        
        // build the search request predicate (query)
        let pred = NSPredicate(format: "(title = %@)", "Propulsion")
        
        request.predicate = pred
        
        if let fetchResult = (try? viewContext.fetch(request)) {
            
            let num = fetchResult.count
            
            if num == 0 {
                
                var timelineIndex = 0
                
                for i in 0 ..< titles.count {
                    
                    let ent = NSEntityDescription.entity(forEntityName: "Fact", in: insertContext)
                    let newItem = Fact(entity: ent!, insertInto: insertContext)
                    newItem.title = titles[i]
                    newItem.desc = descriptions[i]
                    newItem.image = UIImagePNGRepresentation(images[i])! as NSData
                    switch i {
                    case 0...6:
                        newItem.categoryType = "Engineering"
                    case 7...10:
                        newItem.categoryType = "Engineering"
                        newItem.date = dates[timelineIndex]
                        newItem.timelineImage = UIImagePNGRepresentation(timelineImages[timelineIndex])! as NSData
                        newItem.timelineEvent = Int32(timelineEventOrder[timelineIndex])
                        //print("timelineEventOrder index: \(timelineEventOrder[timelineIndex])")
                        timelineIndex+=1
                        
                    case 11...19:
                        newItem.categoryType = "Asteroid"
                    case 20...24:
                        newItem.categoryType = "Journey"
                    case 25...30:
                        newItem.categoryType = "Journey"
                        newItem.date = dates[timelineIndex]
                        newItem.timelineImage = UIImagePNGRepresentation(timelineImages[timelineIndex])! as NSData
                        newItem.timelineEvent = Int32(timelineEventOrder[timelineIndex])
                        
                        timelineIndex+=1
                    default:
                        newItem.categoryType = "None"
                    }
                    
                    // use this if you want to put your images into an array
                    //newItem.image = UIImagePNGRepresentation(images[i])! as NSData
                    
                }
                do {
                    try insertContext.save()
                } catch _ {
                    print("Error saving context")
                }
            }
        }
        
    } // end viewDidLoad
            
            
            
    
    
    //fetch images from website, store in core data
    
    var imageArray = [UIImage]()
    
     //To be used to fetch images
     func getImages(){
        print("fetching images now. loading..")
        var pagedata:String = ""
        var i = 1, added = 16
        while added == 16 {
            added=0
            let url: URL = URL(string: "https://psyche.asu.edu/galleries/images/page/" + String(i))!
            do{
                try pagedata = String(contentsOf: url)
            } catch _ {}
            let arr = pagedata.split(separator: "<")
            var findend=false
            finder: for str in arr {
                if findend{
                    let stri = str.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
                    if stri == "/section>" {
                        break finder
                    }
                    if stri.hasPrefix("img") {
                        var looker = stri.split(separator: " ")[3]
                        var end = looker.suffix(5)
                        looker = looker.prefix(upTo: looker.index(looker.endIndex, offsetBy: -13)) + end
                        //print(looker)
                        do{
                            try imageArray.append(UIImage(data: Data(contentsOf: URL(string: String(looker.suffix(from: looker.index(looker.startIndex, offsetBy: 5))).trimmingCharacters(in: CharacterSet(charactersIn: "\"")))!))!)
                        } catch _ {}
                        added+=1
                    }
                }
                if str.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == "section class=\"gallery-grid container\">" {
                    findend=true
                }
            }
            i+=1
        }
        print("done fetching images")
        
        } //end fetch images
       
            
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is MediaGallery
        {
            let imgarr = segue.destination as? MediaGallery
            imgarr?.imgarr = imageArray
        }
    }
    
    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
    }
   
}








