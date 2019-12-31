//
//  ViewController.swift
//  server communication
//
//  Created by R Shantha Kumar on 8/29/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    
    var URLReqObject:URLRequest!
    var dataTaskObj:URLSessionDataTask!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        indiaStates(type: "states", quantity: "5")
        actors(type: "actors", quantity: "50")
        quotes(type: "quotes", quantity: "5")
        pulseLogin(registeredEmail:"shanth923@gmail.com",registeredPassword:"9493215373v@",funcName:"verifyLogin")
        attendanceDetails(funcName:"getUserAttendance",studentIDByAdmin:"NoValue")
        
        
        
    }
    //states
    //GET method
    
    func indiaStates(type:String,quantity:String){
        
        URLReqObject = URLRequest(url:URL(string:"https:www.brninfotech.com/tws/IndiaDetails.php?type=\(type)&quantity=\(quantity)")!)
        URLReqObject.httpMethod="GET"
        dataTaskObj = URLSession.shared.dataTask(with:URLReqObject,completionHandler:{(data, conncetionDetails,error) in
            print("got data from server")
            do{
                var covertedData = try
                    JSONSerialization.jsonObject(with:data!,options:JSONSerialization.ReadingOptions.allowFragments)as! [String]
                print(covertedData)
            }catch
            {
                print("something went wrong")
            }
            
        })
        dataTaskObj.resume()
    }
    
    //----------------------------------------------------------------------------------------------------------------
    //actors
    
    //POST method
    
    func actors(type:String,quantity:String){
        
        
        URLReqObject = URLRequest(url:URL(string:"https:www.brninfotech.com/tws/Quotes.php")!)
        URLReqObject.httpMethod="POST"
        var  dataToSend="type=\(type)&quantity=\(quantity)"
        
        URLReqObject.httpBody = dataToSend.data(using:String.Encoding.utf8)
        
        dataTaskObj = URLSession.shared.dataTask(with:URLReqObject,completionHandler:{(data, conncetionDetails,error) in
            
            print("got data from server")
            
            do{
                var covertedData = try
                    JSONSerialization.jsonObject(with:data!,options:JSONSerialization.ReadingOptions.allowFragments)as! [String]
                print(covertedData)
            }catch
            {
                print("something went wrong")
            }
            
        })
        dataTaskObj.resume()
    }
    
    //---------------------------------------------------------------------------------------------------------------
    //quotes
    func quotes(type:String,quantity:String){
        
        
        URLReqObject = URLRequest(url:URL(string:"https:www.brninfotech.com/tws/Quotes.php")!)
        URLReqObject.httpMethod="POST"
        var  dataToSend="type=\(type)&quantity=\(quantity)"
        
        URLReqObject.httpBody = dataToSend.data(using:String.Encoding.utf8)
        
        dataTaskObj = URLSession.shared.dataTask(with:URLReqObject,completionHandler:{(data, conncetionDetails,error) in
            
            print("got data from server")
            
            do{
                var covertedData = try
                    JSONSerialization.jsonObject(with:data!,options:JSONSerialization.ReadingOptions.allowFragments)as! [String]
                print(covertedData)
            }catch
            {
                print("something went wrong")
            }
            
        })
        dataTaskObj.resume()
    }
    //-------------------------------------------------------------------------
    // pulse login
    
    
    func pulseLogin(registeredEmail:String,registeredPassword:String,funcName:String){
        
        
        URLReqObject = URLRequest(url:URL(string:"https://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php")!)
        URLReqObject.httpMethod="POST"
        var  dataToSend="registeredEmail=\(registeredEmail)&registeredPassword=\(registeredPassword)&funcName=\(funcName)"
        
        URLReqObject.httpBody = dataToSend.data(using:String.Encoding.utf8)
        
        dataTaskObj = URLSession.shared.dataTask(with:URLReqObject,completionHandler:{(data, conncetionDetails,error) in
            
            print("got data from server")
            
            do{
                let covertedDatas = try JSONSerialization.jsonObject(with:data!,options:JSONSerialization.ReadingOptions.allowFragments) as! [String:String]
                
                print(covertedDatas)
                
            }catch
            {
                print("something went wrong")
            }
            
        })
        dataTaskObj.resume()
    }
    
    //------------------------------------------------------------------------------------------------------------
    //atteandance
    
    func attendanceDetails(funcName:String,studentIDByAdmin:String){
        
        
        URLReqObject = URLRequest(url:URL(string:"https://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php")!)
        URLReqObject.httpMethod="POST"
        var  dataToSend="funcName=\(funcName)&studentIDByAdmin=\(studentIDByAdmin)"
        
        URLReqObject.httpBody = dataToSend.data(using:String.Encoding.utf8)
        
        dataTaskObj = URLSession.shared.dataTask(with:URLReqObject,completionHandler:{(data, conncetionDetails,error) in
            
            print("got data from server")
            
            do{
                let covertedDatas = try JSONSerialization.jsonObject(with:data!,options:JSONSerialization.ReadingOptions.allowFragments)
                
                print(covertedDatas)
                
            }catch
            {
                print("something went wrong")
            }
            
        })
        dataTaskObj.resume()
    }
    
    
    
    
    
    
    
}

