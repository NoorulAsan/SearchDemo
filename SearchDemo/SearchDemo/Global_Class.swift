//
//  Global_Class.swift
//  SearchDemo
//
//  Created by MacMini on 08/02/18.
//  Copyright © 2018 MacMini. All rights reserved.
//

import UIKit
import Foundation

//MARK:- GET DATA LIST
func get_data_list() -> NSMutableArray {
    
    let dict_data_1 = ["Name":"Avatar", "Id":"1", "Source":"IMDB" , "Rank":"1", "Type":"Movie", "WebLink":"http://www.imdb.com/title/tt0499549/", "Year":"2009"]
    
    let dict_data_2 = ["Name":"Armageddon", "Id":"2", "Source":"WIKI", "Rank":"2", "Type":"Movie", "WebLink":"https://en.wikipedia.org/wiki/Armageddon_(1998_film)", "Year":"1998"]
    
    let dict_data_3 = ["Name":"The Machinist", "Id":"3", "Source":"IMDB", "Rank":"3", "Type":"Movie", "WebLink":"http://www.imdb.com/title/tt0361862/", "Year":"2004"]
    
    let dict_data_4 = ["Name":"Titanic", "Id":"4", "Source":"WIKI", "Rank":"4", "Type":"Movie", "WebLink":"https://en.wikipedia.org/wiki/Titanic_(1997_film)", "Year":"1997"]
    
    let dict_data_5 = ["Name":"Inception", "Id":"5", "Source":"WIKI", "Rank":"5", "Type":"Movie", "WebLink":"https://en.wikipedia.org/wiki/Inception", "Year":"2010"]
    
    let dict_data_6 = ["Name":"Django Unchained", "Id":"6", "Source":"WIKI", "Rank":"6", "Type":"Movie", "WebLink":"https://en.wikipedia.org/wiki/Django_Unchained", "Year":"2012"]
    
    let dict_data_7 = ["Name":"London Has Fallen", "Id":"7", "Source":"WIKI", "Rank":"7", "Type":"Movie", "WebLink":"https://en.wikipedia.org/wiki/London_Has_Fallen", "Year":"2016"]
    
    let dict_data_8 = ["Name":"Escape Plan", "Id":"8", "Source":"WIKI", "Rank":"8", "Type":"Movie", "WebLink":"https://en.wikipedia.org/wiki/Escape_Plan_(film)", "Year":"2013"]
    
    let dict_data_9 = ["Name":"John Wick", "Id":"9", "Source":"IMDB", "Rank":"9", "Type":"Movie", "WebLink":"http://www.imdb.com/title/tt2911666/", "Year":"2009"]
    
    let dict_data_10 = ["Name":"Nayakan", "Id":"10", "Source":"IMDB", "Rank":"10", "Type":"Movie", "WebLink":"http://www.imdb.com/title/tt0093603/", "Year":"1987"]
    
    let arr_datas = NSMutableArray()
    arr_datas.add(dict_data_1)
    arr_datas.add(dict_data_2)
    arr_datas.add(dict_data_3)
    arr_datas.add(dict_data_4)
    arr_datas.add(dict_data_5)
    arr_datas.add(dict_data_6)
    arr_datas.add(dict_data_7)
    arr_datas.add(dict_data_8)
    arr_datas.add(dict_data_9)
    arr_datas.add(dict_data_10)
    return arr_datas
}

//MARK:- COMMON ALERT VIEWCONTROLLER
func alertMsg(viewController:UIViewController,title:String,message:String)
{
    let alertController = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    viewController.present(alertController, animated: true, completion: nil)
}
