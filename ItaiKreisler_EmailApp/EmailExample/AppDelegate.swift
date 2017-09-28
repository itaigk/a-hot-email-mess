//
//  AppDelegate.swift
//  EmailExample
//
//  Created by Emily Byrne on 9/18/17.
//  Copyright © 2017 Byrne. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //TODO: populate our datapool with initial emails
        //NEED: access to datapool object
        let splitVC = self.window?.rootViewController as! UISplitViewController
        let navVC = splitVC.viewControllers.first as! UINavigationController
        let menuTVC = navVC.viewControllers.first as! MenuTVC
        
        menuTVC.dataDictionary = ["Inbox":[Email(sender: "fellow.student@asu.edu", recipient: "itai.kreisler@asu.edu", subject: "Project Question", contents: "Hi help me please"),Email(sender: "moocher.kid@asu.edu", recipient: "itai.kreisler@asu.edu", subject: "Project 'Question'", contents: "Hi send me all your answers please"), Email(sender: "congolese.prince@asu.edu", recipient: "itai.kreisler@asu.edu", subject: "SEEKING YOUR ASSISTANCE", contents: "FROM: MR DAN PATRICK. DEMOCRATIC REPUBLIC OF CONGO. ALTERNATIVE EMAIL: (patrickdan@rediffmail.com). Dear Sir, SEEKING YOUR IMMEDIATE ASSISTANCE. Please permit me to make your acquaintance in so informal a manner. This is necessitated by my urgent need to reach a dependable and trust wordy foreign partner. This request may seem strange and unsolicited but I will crave your indulgence and pray that you view it seriously. My name is. DAN PATRICK of the Democratic Republic of Congo and One of the close aides to the former President of the Democratic Republic of Congo LAURENT KABILA of blessed memory, may his soul rest in peace. Due to the military campaign of LAURENT KABILA to force out the rebels in my country, I and some of my colleagues were instructed by Late President Kabila to go abroad to purchase arms and ammunition worth of Twenty Million, Five Hundred Thousand United States Dollars only (US$20,500,000.00) to fight the rebel group. But when President Kabila was killed in a bloody shoot-out by one of his aide a day before we were schedule to travel out of Congo, We immediately decided to divert the fund into a private security company here in Congo for safe keeping. The security of the said amount is presently being threatened here following the arrest and seizure of properties of Col.Rasheidi Karesava (One of the aides to Laurent Kabila) a tribesman, and some other Military Personnel from our same tribe, by the new President of the Democratic Republic of Congo, the son of late President Laurent Kabila, Joseph Kabila. In view of this, we need a reliable and trustworthy foreign partner who can assist us to move this money out of my country as the beneficiary. WE have sufficient ''CONTACTS'' to move the fund under Diplomatic Cover to a security company in the Europe in your name. This is to ensure that the Diplomatic Baggage is marked ''CONFIDENTIAL'' and it will not pass through normal custom/airport screening and clearance. Our inability to move this money out of Congo all This while lies on our lack of trust on our supposed good friends (western countries) who suddenly became hostile to those of us who worked with the late President Kabila, immediately after his son took office. Though we have neither seen nor met each other, the information we gathered from an associate who has worked in your country has encouraged and convinced us that with your sincere assistance, this transaction will be properly handled with modesty and honesty to a huge success within two weeks. The said money is a state fund and therefore requires a total confidentiality. Thus, if you are willing to assist us move this fund out of Congo, you can contact me through my email address above with your telephone, fax number and personal information to enable us discuss the modalities and what will be your share (percentage) for assisting us. I must use this opportunity and medium to implore You to exercise the utmost indulgence to keep this Matter extraordinarily confidential, Whatever your Decision, while I await your prompt response. NOTE: FOR CONFIDENTIALITY, I WILL ADVISE YOU REPLY ME ON MY ALTERNATIVE EMAIL BOX (patrickdan@rediffmail.com).Thank you and God Bless. Best Regards, MR DAN PATRICK."), Email(sender: "dad@asu.edu", recipient: "itai.kreisler@asu.edu", subject: "great joke i heard", contents: "Hi its dad. Here's a great joke. Why do chicken coops only have two doors? Because if they had four, they would be chicken sedans! Love you, have  a great day!!")], "Sent":[Email(sender: "itai.kreisler@asu.edu", recipient: "prof@asu.edu", subject: "Homework", contents: "Hi Im lost please help"), Email(sender: "itai.kreisler@asu.edu", recipient: "moocher.kid@asu.edu", subject: "Homework", contents: "Heres the homework you moocher! \n *Attachment - filename: fake_homework_cuz_moocher_kid_is_lazy.pdf"),Email(sender: "itai.kreisler@asu.edu", recipient: "dad@asu.edu", subject: "Great Dad Joke", contents: "Hi dad, great joke. heres another: \n Two guys walk into a bar, the third one ducks. \n Love you, have a great day too!")], "Trash":[Email(sender: "alert@asu.edu", recipient: "itai.kreisler@asu.edu", subject: "Bees", contents: "Hi help me please there are bees"), Email(sender: "alert@asu.edu", recipient: "itai.kreisler@asu.edu", subject: "Uh, Bees", contents: "Hi help me please there are even more bees. I think they're having kids."), Email(sender: "alert@asu.edu", recipient: "itai.kreisler@asu.edu", subject: " SO MANY BEES", contents: "THEY'RE EVERYWHERE WHAT DO I DO!!!!????")]]
        
        /*
        rootTVC.emails.append(Email(sender: "fellow.student@asu.edu", subject: "Project Question", contents: "Hi help me please"))
        rootTVC.emails.append(Email(sender: "prof@asu.edu", subject: "Homework", contents: "Hi turn it in please"))
        rootTVC.emails.append(Email(sender: "alert@asu.edu", subject: "Bees", contents: "Hi help me please there are bees"))
        */
        let detailVC = splitVC.viewControllers.last as! ViewController
        
        menuTVC.delegate = detailVC

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

