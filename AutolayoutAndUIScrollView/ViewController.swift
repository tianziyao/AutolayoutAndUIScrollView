//
//  ViewController.swift
//  AutolayoutAndUIScrollView
//
//  Created by 田子瑶 on 17/1/1.
//  Copyright © 2017年 田子瑶. All rights reserved.
//

import UIKit
import SnapKit

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    var scrollView = UIScrollView()
    var containerView = UIView()

    let scrollHeight: CGFloat = ScreenHeight / 3
    let boxWidth: CGFloat = 200
    let boxHeight: CGFloat = 100
    let boxGap: CGFloat = 20
    let subviewCount = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.bounces = false
        view.addSubview(scrollView)
        scrollView.backgroundColor = UIColor.yellow
        scrollView.addSubview(containerView)
        containerView.backgroundColor = UIColor.blue
        
        layoutWithContainerForWidthAdaptive()
        //layoutWithContainerForHeightAdaptive()
    }
    
    override func viewDidLayoutSubviews() {

        print(#function, scrollView.contentSize)
    }
    
    func layoutWithContainerForHeightAdaptive() {
        
        scrollView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(view)
        }
        
        containerView.snp.makeConstraints { (make)  in
            make.edges.equalTo(scrollView)
            make.width.equalTo(view)
        }

        /*
        let redBoxView = UIView()
        redBoxView.backgroundColor = UIColor.red
        containerView.addSubview(redBoxView)
        redBoxView.snp.makeConstraints { (make) in
            make.left.right.equalTo(containerView)
            make.height.equalTo(boxHeight)
            make.top.equalTo(containerView).inset(boxGap)
        }

        let yellowBoxView = UIView()
        yellowBoxView.backgroundColor = UIColor.yellow
        containerView.addSubview(yellowBoxView)
        yellowBoxView.snp.makeConstraints { (make) in
            make.left.right.equalTo(containerView)
            make.height.equalTo(boxHeight)
            make.top.equalTo(redBoxView.snp.bottom).inset(-(boxGap))
        }

        let purpleBoxView = UIView()
        purpleBoxView.backgroundColor = UIColor.purple
        containerView.addSubview(purpleBoxView)
        purpleBoxView.snp.makeConstraints { (make) in
            make.left.right.equalTo(containerView)
            make.height.equalTo(boxHeight)
            make.top.equalTo(yellowBoxView.snp.bottom).inset(-(boxGap))
        }

        containerView.snp.makeConstraints { (make) in
            make.bottom.equalTo(purpleBoxView).inset(-(boxGap))
        }*/
        
        for i in 1...subviewCount {
            
            let box = UILabel()
            box.text = "\(i)"
            box.tag = i
            box.backgroundColor = UIColor.red
            containerView.addSubview(box)
            
            box.snp.makeConstraints({ (make) in
                make.left.right.equalTo(containerView)
                make.height.equalTo(boxHeight)
                
                if i == 1 {
                    make.top.equalTo(containerView).inset(boxGap)
                }
                else if i <= subviewCount {
                    let previousBox = containerView.subviews[i - 2]
                    make.top.equalTo(previousBox.snp.bottom).inset(-(boxGap))
                }
                
                if i == subviewCount {
                    containerView.snp.makeConstraints { (make)  in
                        make.bottom.equalTo(box).inset(-(boxGap))
                    }
                }
            })
        }
        
        self.view.layoutSubviews()
        self.view.layoutIfNeeded()
    }
    
    func layoutWithContainerForWidthAdaptive() {
        
        scrollView.snp.makeConstraints { (make) in
            make.centerY.equalTo(view.snp.centerY)
            make.left.right.equalTo(view)
            make.height.equalTo(scrollHeight)
        }
        
        containerView.snp.makeConstraints { (make)  in
            make.edges.equalTo(scrollView)
            make.height.equalTo(scrollHeight)
        }
        
        /*
        let redBoxView = UIView()
        redBoxView.backgroundColor = UIColor.red
        containerView.addSubview(redBoxView)
        redBoxView.snp.makeConstraints { (make) in
            make.top.height.equalTo(containerView)
            make.width.equalTo(boxWidth)
            make.left.equalTo(boxGap)
        }
        
        let yellowBoxView = UIView()
        yellowBoxView.backgroundColor = UIColor.yellow
        containerView.addSubview(yellowBoxView)
        yellowBoxView.snp.makeConstraints { (make) in
            make.top.height.equalTo(containerView)
            make.width.equalTo(boxWidth)
            make.left.equalTo(redBoxView.snp.right).inset(boxGap)
        }
        
        let purpleBoxView = UIView()
        purpleBoxView.backgroundColor = UIColor.purple
        containerView.addSubview(purpleBoxView)
        purpleBoxView.snp.makeConstraints { (make) in
            make.top.height.equalTo(containerView)
            make.width.equalTo(boxWidth)
            make.left.equalTo(yellowBoxView.snp.right).inset(boxGap)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.right.equalTo(purpleBoxView).inset(-(boxGap))
        }*/
        
        for i in 1...subviewCount {
            
            let box = UILabel()
            box.text = "\(i)"
            box.tag = i
            box.backgroundColor = UIColor.red
            containerView.addSubview(box)
            
            box.snp.makeConstraints({ (make) in
                make.top.height.equalTo(containerView)
                make.width.equalTo(boxWidth)
                
                if i == 1 {
                    make.left.equalTo(containerView).offset(boxGap)
                }
                else if i <= subviewCount {
                    let previousBox = containerView.subviews[i - 2]
                    make.left.equalTo(previousBox.snp.right).offset(boxGap)
                }
                
                if i == subviewCount {
                    containerView.snp.makeConstraints { (make)  in
                        make.right.equalTo(box).inset(-(boxGap))
                    }
                }
            })
        }
        
        self.view.layoutSubviews()
        self.view.layoutIfNeeded()
    }

}

