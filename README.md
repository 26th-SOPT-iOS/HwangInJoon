# HwangInJun
🖥 26 Sopt OB iOS 황인준 🖥
***

| 주차  |                      실습 내용 및 주제                       | 구현 |
| :---: | :----------------------------------------------------------: | :--: |
| 1주차 | View 전환 및 데이터 전달 / 네비게이션 컨트로러를 이용한 Login Logout 화면 제작 |  🔵   |
| 2주차 | StackView ScrollView를 이용한 다양한 AutoLayOut 공부 및 View 제작 |  🔵   |
| 3주차 | Delegate & Protocol, UIPickerVIew, UITableView, UICollectionView 전체적으로 톺아보다. |  🔵   |
| 4주차 | AlamoFire를 이용한 Post통신 및 Login LogOut 통신하기 + 회원가입 실습 |  🔵   |
| 5주차 | 디자인 + iOS 합동 세미나 / 국방부앱 리뉴얼 제작 완성 (ScrollView + CollectionView + CustomTabbar) |  🔵   |
| 6주차 | Server + iOS 합동 세미나 / 서버APi를 이용해 Data를 get통신 후 , View에 맞게 대입 |  🔵   |

***





* [1차 뷰 전환 과제](https://github.com/26th-SOPT-iOS/HwangInJoon/tree/master/과제/26th_iOS_FirstAssignment) - 완료

* present는 스토리보드로 , push는 코드로

```swift
@IBAction func touchUpRedButton(_ sender: Any) {        
guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "RedVC") as? RedViewController else { return  }

self.navigationController?.pushViewController(nextVC, animated: true)
        
}
```



* [1차 로그인 뷰 과제](https://github.com/26th-SOPT-iOS/HwangInJoon/tree/master/과제/LoginAssignment) - 완료

```swift
pwTextField.isSecureTextEntry = true
//textField 암호값으로 변경 + 보안
```



```swift
 self.present(nextVC, animated: true){
            self.navigationController?.popViewController(animated: true)
        }
//회원가입화면뷰 - 다음뷰를 프레젠트하며, 컴플리션을 이용해 네비게이션 컨트롤러의 뷰컨을 팝해준다.
```



