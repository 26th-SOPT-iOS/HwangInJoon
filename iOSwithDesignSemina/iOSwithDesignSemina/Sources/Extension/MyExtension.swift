//
//  MyExtension.swift
//  iOSwithDesignSemina
//
//  Created by IJ . on 2020/05/26.
//  Copyright © 2020 jun. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}


extension UIImageView{
    func setImage(from url: String, completion: @escaping (UIImage?) -> Void)
    {
        // URL이 들어오는 것을 Cache 키로 사용
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url)!, placeholder: UIImage(),
                         options: [.transition(.fade(1))], progressBlock: nil) { result in
                            switch result {
                            case .success(let value):
                                completion(value.image)
                            case .failure(let err):
                                print(err.errorCode)
                                completion(nil)
                            }
        }
    }
}
