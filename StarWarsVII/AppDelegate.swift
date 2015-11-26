//
//  AppDelegate.swift
//  StarWarsVII
//
//  Created by Ramiro García Salazar on 19/11/15.
//  Copyright © 2015 Ramiro García Salazar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    
    var model : StarWarsUniverse?
    var sb : UIStoryboard?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        do{
            //Arranco la App a manubrio
            if let url = NSBundle.mainBundle().URLForResource("regulaCharacters.json"),
                data = NSData(contentsOfURL: url),
                jsons = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONArray{
                    
                    model = StarWarsUniverse(characters: decode(starWarsCharacters: jsons))
            }
            
        }catch{
            print("Error chungo...!")
        }
        
        // crear la interfaz
        sb = UIStoryboard(name: "EpisodeVII", bundle: nil)
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = sb?.instantiateInitialViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Split view

    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController, ontoPrimaryViewController primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }
    
    func tddPaPobres(){
        
        
        if let image = UIImage(named: "vader.jpg"),
            soundFileURL = NSBundle.mainBundle().URLForResource("vader", withExtension: "caf"),
            soundFile = NSData(contentsOfURL: soundFileURL),
            wikiURL = NSURL(string: "https://en.wikipedia.org/wiki/Darth_Vader")
        {
            
            let vader = ForceSensitive(sithWithFirstName: "Anakin"
                , lastName: "Skywalker", alias: "Darth Vader", soundData: soundFile, photo: image, url: wikiURL, midichlorians: 15_000)
            
            print(vader)
            
            
            
        }
        
        // Probar parseado de JSON e inicialización de objetos del modelo.
        do{
            if let url = NSBundle.mainBundle().URLForResource("regularCharacters.json"),
                data = NSData(contentsOfURL: url),
                characters = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONArray
            {
                // Ver un JSONObject que esté dentro del JSONArray
                let jabbaJSON = characters[4]
                do{
                    let strictJabba = try decode(starWarsCharacter: jabbaJSON)
                    let jabba = StarWarsCharacter(strictStarWarsCharacter:  strictJabba)
                    
                    print("Menudo vesitido más bonito \(jabba)")
                }catch{
                    print("LA cagamos al extraer jabba")
                }
                
                let strictChars = decode(starWarsCharacters: characters)
                
                let u = StarWarsUniverse(characters: strictChars)
                print(u)
            }
        }catch{
            print("La cagamos")
        }
        
        
        
        
        
        
        
    }

}

