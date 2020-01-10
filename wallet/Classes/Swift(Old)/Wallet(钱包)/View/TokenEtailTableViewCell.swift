//
//  TokenEtailTableViewCell.swift
//  wallet
//
//  Created by 曾云 on 2019/8/24.
//  Copyright © 2019 talking　. All rights reserved.
//

import UIKit

class TokenEtailTableViewCell: UITableViewCell {

    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var wallet: UILabel!
    
    
    /*
     
     如果from和数据库address 转小写比较   相等:
     显示 OUT     否则 显示 IN
     如果tokenName 是空字符串,显示 CCM   否则显示 tokenName 字段
     status 等于  0x1  ,  显示 success, 否则显示   failure
     如果value > 0  显示 value 除 1000000000000000000 ,  否则显示 realValue
     转账时间   timestamp
     
     */
    var newItem : TokendEtailItemModel!
    var item : TokendEtailItemModel {
        set {
            self.newItem = newValue
            self.time.text = SKUtils.date(toString: NSDate.init(timeIntervalSince1970: TimeInterval(self.newItem!.timestamp)) as Date, withDateFormat: "yyyy-MM-dd HH:mm:ss")
            let address = CustomUserManager.customShared().userModel().ethAddress.lowercased()
            print(String(format: "%@\n %@",address,newValue.from))
            var tokenName = "CCM"
            if (newValue.tokenName.length > 0) {
                tokenName = newValue.tokenName as String
            }
            
            var value:Double = 0.0000
            self.wallet.text = String(format: "%@ %@",newValue.realValue,tokenName)
            print("realValue == \(newValue.realValue) value == \(newValue.value)")
            if (newValue.value > 0) {
                let valueStr:String =  String(newValue.value)
                 value = Double.init(valueStr)!/Double(1_000_000_000_000_000_000)
                 print("字符串截取:" + String(value))
//                if (valueStr.length > 10) {
//                    valueStr = String(valueStr.prefix(valueStr.length - 9));
//                    print("字符串截取" + valueStr)
//                    var v:Double = Double.init(valueStr)!
//                    v = v/100000000
//                    print("字符串截取:" + String(v))
//                    value = Double(v)
//                   
//                }
                
                
//
                self.wallet.text = String(format: "%f %@",value,tokenName)
            }
            
            
            
            self.type.text = "收款"
            self.wallet.textColor = UIColor.init(hexColor: "#C6A771")
            if address == newValue.from as String {
             //OUT
                self.type.text = "转账"
                self.wallet.textColor = UIColor.init(hexColor: "#2E303B")
            }
        }
        get {
            return self.newItem
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

   private func itemModelData(item:TokendEtailItemModel) {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
